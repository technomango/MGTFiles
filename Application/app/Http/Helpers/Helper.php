<?php

use App\Http\Methods\FileDetailsDetector;
use App\Http\Methods\SubscriptionManager;
use App\Models\Additional;
use App\Models\Addon;
use App\Models\Admin;
use App\Models\AdminNotification;
use App\Models\Advertisement;
use App\Models\Country;
use App\Models\Extension;
use App\Models\Language;
use App\Models\MailTemplate;
use App\Models\PaymentGateway;
use App\Models\Plan;
use App\Models\Settings;
use App\Models\Subscription;
use App\Models\SupportTicket;
use App\Models\Tax;
use App\Models\Translate;
use App\Models\User;
use App\Models\UserNotification;
use Carbon\Carbon;
use Hashids\Hashids;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Jenssegers\Date\Date;

function demoMode()
{
    if (env('DEMO_MODE')) {
        return true;
    }
    return false;
}

function adminAuthInfo()
{
    $info = null;
    if (Auth::guard('admin')->check()) {
        $info = Admin::find(Auth::guard('admin')->user()->id);
        $info['name'] = $info->firstname . ' ' . $info->lastname;
    }
    return $info;
}

function userAuthInfo()
{
    $info = null;
    if (Auth::user()) {
        $info = User::where('id', Auth::user()->id)->with('subscription')->first();
        $info['name'] = $info->firstname . ' ' . $info->lastname;
    }
    return $info;
}

function settings($key = null)
{
    $settings = Settings::pluck('value', 'key')->all();
    if (!empty($key)) {
        return $settings[$key];
    }
    return $settings;

}

function extension($symbol)
{
    $extension = Extension::where('symbol', $symbol)->first();
    return $extension;
}

function countries()
{
    $countries = Country::all();
    return $countries;
}

function additionals($key = null)
{
    $additionals = Additional::pluck('value', 'key')->all();
    if (!empty($key)) {
        return $additionals[$key];
    }
    return $additionals;

}

function ads($symbol)
{
    $ad = Advertisement::where([['symbol', $symbol], ['status', 1]])->first();
    return $ad;
}

function curl_get_file_contents($URL)
{
    $c = curl_init();
    curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($c, CURLOPT_URL, $URL);
    $contents = curl_exec($c);
    curl_close($c);

    if ($contents) {
        return $contents;
    } else {
        return false;
    }
}

function dateFormatsArray()
{
    $today = Carbon::now();
    $dateFormatsArray = [
        '0' => 'm-d-Y',
        '1' => 'd-m-Y',
        '2' => 'm/d/Y',
        '3' => 'd/m/Y',
        '4' => 'm-d-Y h:i A',
        '5' => 'd-m-Y h:i A',
        '6' => 'm/d/Y h:i A',
        '7' => 'd/m/Y h:i A',
        '8' => 'M d, Y',
        '9' => 'F d, Y',
        '10' => 'M d, Y h:i A',
        '11' => 'F d, Y h:i A',
        '12' => 'd M, Y',
        '13' => 'd F, Y',
        '14' => 'd M, Y h:i A',
        '15' => 'd F, Y h:i A',
    ];
    return $dateFormatsArray;
}

function vDate($date)
{
    Date::setLocale(getLang());
    $format = Date::parse($date)->format(dateFormatsArray()[settings('date_format')]);
    return $format;
}

function timezonesArray()
{
    $timezonesArr = [
        'America/Adak' => '(GMT-10:00) America/Adak (Hawaii-Aleutian Standard Time)',
        'America/Atka' => '(GMT-10:00) America/Atka (Hawaii-Aleutian Standard Time)',
        'America/Anchorage' => '(GMT-9:00) America/Anchorage (Alaska Standard Time)',
        'America/Juneau' => '(GMT-9:00) America/Juneau (Alaska Standard Time)',
        'America/Nome' => '(GMT-9:00) America/Nome (Alaska Standard Time)',
        'America/Yakutat' => '(GMT-9:00) America/Yakutat (Alaska Standard Time)',
        'America/Dawson' => '(GMT-8:00) America/Dawson (Pacific Standard Time)',
        'America/Ensenada' => '(GMT-8:00) America/Ensenada (Pacific Standard Time)',
        'America/Los_Angeles' => '(GMT-8:00) America/Los_Angeles (Pacific Standard Time)',
        'America/Tijuana' => '(GMT-8:00) America/Tijuana (Pacific Standard Time)',
        'America/Vancouver' => '(GMT-8:00) America/Vancouver (Pacific Standard Time)',
        'America/Whitehorse' => '(GMT-8:00) America/Whitehorse (Pacific Standard Time)',
        'Canada/Pacific' => '(GMT-8:00) Canada/Pacific (Pacific Standard Time)',
        'Canada/Yukon' => '(GMT-8:00) Canada/Yukon (Pacific Standard Time)',
        'Mexico/BajaNorte' => '(GMT-8:00) Mexico/BajaNorte (Pacific Standard Time)',
        'America/Boise' => '(GMT-7:00) America/Boise (Mountain Standard Time)',
        'America/Cambridge_Bay' => '(GMT-7:00) America/Cambridge_Bay (Mountain Standard Time)',
        'America/Chihuahua' => '(GMT-7:00) America/Chihuahua (Mountain Standard Time)',
        'America/Dawson_Creek' => '(GMT-7:00) America/Dawson_Creek (Mountain Standard Time)',
        'America/Denver' => '(GMT-7:00) America/Denver (Mountain Standard Time)',
        'America/Edmonton' => '(GMT-7:00) America/Edmonton (Mountain Standard Time)',
        'America/Hermosillo' => '(GMT-7:00) America/Hermosillo (Mountain Standard Time)',
        'America/Inuvik' => '(GMT-7:00) America/Inuvik (Mountain Standard Time)',
        'America/Mazatlan' => '(GMT-7:00) America/Mazatlan (Mountain Standard Time)',
        'America/Phoenix' => '(GMT-7:00) America/Phoenix (Mountain Standard Time)',
        'America/Shiprock' => '(GMT-7:00) America/Shiprock (Mountain Standard Time)',
        'America/Yellowknife' => '(GMT-7:00) America/Yellowknife (Mountain Standard Time)',
        'Canada/Mountain' => '(GMT-7:00) Canada/Mountain (Mountain Standard Time)',
        'Mexico/BajaSur' => '(GMT-7:00) Mexico/BajaSur (Mountain Standard Time)',
        'America/Belize' => '(GMT-6:00) America/Belize (Central Standard Time)',
        'America/Cancun' => '(GMT-6:00) America/Cancun (Central Standard Time)',
        'America/Chicago' => '(GMT-6:00) America/Chicago (Central Standard Time)',
        'America/Costa_Rica' => '(GMT-6:00) America/Costa_Rica (Central Standard Time)',
        'America/El_Salvador' => '(GMT-6:00) America/El_Salvador (Central Standard Time)',
        'America/Guatemala' => '(GMT-6:00) America/Guatemala (Central Standard Time)',
        'America/Knox_IN' => '(GMT-6:00) America/Knox_IN (Central Standard Time)',
        'America/Managua' => '(GMT-6:00) America/Managua (Central Standard Time)',
        'America/Menominee' => '(GMT-6:00) America/Menominee (Central Standard Time)',
        'America/Merida' => '(GMT-6:00) America/Merida (Central Standard Time)',
        'America/Mexico_City' => '(GMT-6:00) America/Mexico_City (Central Standard Time)',
        'America/Monterrey' => '(GMT-6:00) America/Monterrey (Central Standard Time)',
        'America/Rainy_River' => '(GMT-6:00) America/Rainy_River (Central Standard Time)',
        'America/Rankin_Inlet' => '(GMT-6:00) America/Rankin_Inlet (Central Standard Time)',
        'America/Regina' => '(GMT-6:00) America/Regina (Central Standard Time)',
        'America/Swift_Current' => '(GMT-6:00) America/Swift_Current (Central Standard Time)',
        'America/Tegucigalpa' => '(GMT-6:00) America/Tegucigalpa (Central Standard Time)',
        'America/Winnipeg' => '(GMT-6:00) America/Winnipeg (Central Standard Time)',
        'Canada/Central' => '(GMT-6:00) Canada/Central (Central Standard Time)',
        'Canada/East-Saskatchewan' => '(GMT-6:00) Canada/East-Saskatchewan (Central Standard Time)',
        'Canada/Saskatchewan' => '(GMT-6:00) Canada/Saskatchewan (Central Standard Time)',
        'Chile/EasterIsland' => '(GMT-6:00) Chile/EasterIsland (Easter Is. Time)',
        'Mexico/General' => '(GMT-6:00) Mexico/General (Central Standard Time)',
        'America/Atikokan' => '(GMT-5:00) America/Atikokan (Eastern Standard Time)',
        'America/Bogota' => '(GMT-5:00) America/Bogota (Colombia Time)',
        'America/Cayman' => '(GMT-5:00) America/Cayman (Eastern Standard Time)',
        'America/Coral_Harbour' => '(GMT-5:00) America/Coral_Harbour (Eastern Standard Time)',
        'America/Detroit' => '(GMT-5:00) America/Detroit (Eastern Standard Time)',
        'America/Fort_Wayne' => '(GMT-5:00) America/Fort_Wayne (Eastern Standard Time)',
        'America/Grand_Turk' => '(GMT-5:00) America/Grand_Turk (Eastern Standard Time)',
        'America/Guayaquil' => '(GMT-5:00) America/Guayaquil (Ecuador Time)',
        'America/Havana' => '(GMT-5:00) America/Havana (Cuba Standard Time)',
        'America/Indianapolis' => '(GMT-5:00) America/Indianapolis (Eastern Standard Time)',
        'America/Iqaluit' => '(GMT-5:00) America/Iqaluit (Eastern Standard Time)',
        'America/Jamaica' => '(GMT-5:00) America/Jamaica (Eastern Standard Time)',
        'America/Lima' => '(GMT-5:00) America/Lima (Peru Time)',
        'America/Louisville' => '(GMT-5:00) America/Louisville (Eastern Standard Time)',
        'America/Montreal' => '(GMT-5:00) America/Montreal (Eastern Standard Time)',
        'America/Nassau' => '(GMT-5:00) America/Nassau (Eastern Standard Time)',
        'America/New_York' => '(GMT-5:00) America/New_York (Eastern Standard Time)',
        'America/Nipigon' => '(GMT-5:00) America/Nipigon (Eastern Standard Time)',
        'America/Panama' => '(GMT-5:00) America/Panama (Eastern Standard Time)',
        'America/Pangnirtung' => '(GMT-5:00) America/Pangnirtung (Eastern Standard Time)',
        'America/Port-au-Prince' => '(GMT-5:00) America/Port-au-Prince (Eastern Standard Time)',
        'America/Resolute' => '(GMT-5:00) America/Resolute (Eastern Standard Time)',
        'America/Thunder_Bay' => '(GMT-5:00) America/Thunder_Bay (Eastern Standard Time)',
        'America/Toronto' => '(GMT-5:00) America/Toronto (Eastern Standard Time)',
        'Canada/Eastern' => '(GMT-5:00) Canada/Eastern (Eastern Standard Time)',
        'America/Caracas' => '(GMT-4:-30) America/Caracas (Venezuela Time)',
        'America/Anguilla' => '(GMT-4:00) America/Anguilla (Atlantic Standard Time)',
        'America/Antigua' => '(GMT-4:00) America/Antigua (Atlantic Standard Time)',
        'America/Aruba' => '(GMT-4:00) America/Aruba (Atlantic Standard Time)',
        'America/Asuncion' => '(GMT-4:00) America/Asuncion (Paraguay Time)',
        'America/Barbados' => '(GMT-4:00) America/Barbados (Atlantic Standard Time)',
        'America/Blanc-Sablon' => '(GMT-4:00) America/Blanc-Sablon (Atlantic Standard Time)',
        'America/Boa_Vista' => '(GMT-4:00) America/Boa_Vista (Amazon Time)',
        'America/Campo_Grande' => '(GMT-4:00) America/Campo_Grande (Amazon Time)',
        'America/Cuiaba' => '(GMT-4:00) America/Cuiaba (Amazon Time)',
        'America/Curacao' => '(GMT-4:00) America/Curacao (Atlantic Standard Time)',
        'America/Dominica' => '(GMT-4:00) America/Dominica (Atlantic Standard Time)',
        'America/Eirunepe' => '(GMT-4:00) America/Eirunepe (Amazon Time)',
        'America/Glace_Bay' => '(GMT-4:00) America/Glace_Bay (Atlantic Standard Time)',
        'America/Goose_Bay' => '(GMT-4:00) America/Goose_Bay (Atlantic Standard Time)',
        'America/Grenada' => '(GMT-4:00) America/Grenada (Atlantic Standard Time)',
        'America/Guadeloupe' => '(GMT-4:00) America/Guadeloupe (Atlantic Standard Time)',
        'America/Guyana' => '(GMT-4:00) America/Guyana (Guyana Time)',
        'America/Halifax' => '(GMT-4:00) America/Halifax (Atlantic Standard Time)',
        'America/La_Paz' => '(GMT-4:00) America/La_Paz (Bolivia Time)',
        'America/Manaus' => '(GMT-4:00) America/Manaus (Amazon Time)',
        'America/Marigot' => '(GMT-4:00) America/Marigot (Atlantic Standard Time)',
        'America/Martinique' => '(GMT-4:00) America/Martinique (Atlantic Standard Time)',
        'America/Moncton' => '(GMT-4:00) America/Moncton (Atlantic Standard Time)',
        'America/Montserrat' => '(GMT-4:00) America/Montserrat (Atlantic Standard Time)',
        'America/Port_of_Spain' => '(GMT-4:00) America/Port_of_Spain (Atlantic Standard Time)',
        'America/Porto_Acre' => '(GMT-4:00) America/Porto_Acre (Amazon Time)',
        'America/Porto_Velho' => '(GMT-4:00) America/Porto_Velho (Amazon Time)',
        'America/Puerto_Rico' => '(GMT-4:00) America/Puerto_Rico (Atlantic Standard Time)',
        'America/Rio_Branco' => '(GMT-4:00) America/Rio_Branco (Amazon Time)',
        'America/Santiago' => '(GMT-4:00) America/Santiago (Chile Time)',
        'America/Santo_Domingo' => '(GMT-4:00) America/Santo_Domingo (Atlantic Standard Time)',
        'America/St_Barthelemy' => '(GMT-4:00) America/St_Barthelemy (Atlantic Standard Time)',
        'America/St_Kitts' => '(GMT-4:00) America/St_Kitts (Atlantic Standard Time)',
        'America/St_Lucia' => '(GMT-4:00) America/St_Lucia (Atlantic Standard Time)',
        'America/St_Thomas' => '(GMT-4:00) America/St_Thomas (Atlantic Standard Time)',
        'America/St_Vincent' => '(GMT-4:00) America/St_Vincent (Atlantic Standard Time)',
        'America/Thule' => '(GMT-4:00) America/Thule (Atlantic Standard Time)',
        'America/Tortola' => '(GMT-4:00) America/Tortola (Atlantic Standard Time)',
        'America/Virgin' => '(GMT-4:00) America/Virgin (Atlantic Standard Time)',
        'Antarctica/Palmer' => '(GMT-4:00) Antarctica/Palmer (Chile Time)',
        'Atlantic/Bermuda' => '(GMT-4:00) Atlantic/Bermuda (Atlantic Standard Time)',
        'Atlantic/Stanley' => '(GMT-4:00) Atlantic/Stanley (Falkland Is. Time)',
        'Brazil/Acre' => '(GMT-4:00) Brazil/Acre (Amazon Time)',
        'Brazil/West' => '(GMT-4:00) Brazil/West (Amazon Time)',
        'Canada/Atlantic' => '(GMT-4:00) Canada/Atlantic (Atlantic Standard Time)',
        'Chile/Continental' => '(GMT-4:00) Chile/Continental (Chile Time)',
        'America/St_Johns' => '(GMT-3:-30) America/St_Johns (Newfoundland Standard Time)',
        'Canada/Newfoundland' => '(GMT-3:-30) Canada/Newfoundland (Newfoundland Standard Time)',
        'America/Araguaina' => '(GMT-3:00) America/Araguaina (Brasilia Time)',
        'America/Bahia' => '(GMT-3:00) America/Bahia (Brasilia Time)',
        'America/Belem' => '(GMT-3:00) America/Belem (Brasilia Time)',
        'America/Buenos_Aires' => '(GMT-3:00) America/Buenos_Aires (Argentine Time)',
        'America/Catamarca' => '(GMT-3:00) America/Catamarca (Argentine Time)',
        'America/Cayenne' => '(GMT-3:00) America/Cayenne (French Guiana Time)',
        'America/Cordoba' => '(GMT-3:00) America/Cordoba (Argentine Time)',
        'America/Fortaleza' => '(GMT-3:00) America/Fortaleza (Brasilia Time)',
        'America/Godthab' => '(GMT-3:00) America/Godthab (Western Greenland Time)',
        'America/Jujuy' => '(GMT-3:00) America/Jujuy (Argentine Time)',
        'America/Maceio' => '(GMT-3:00) America/Maceio (Brasilia Time)',
        'America/Mendoza' => '(GMT-3:00) America/Mendoza (Argentine Time)',
        'America/Miquelon' => '(GMT-3:00) America/Miquelon (Pierre & Miquelon Standard Time)',
        'America/Montevideo' => '(GMT-3:00) America/Montevideo (Uruguay Time)',
        'America/Paramaribo' => '(GMT-3:00) America/Paramaribo (Suriname Time)',
        'America/Recife' => '(GMT-3:00) America/Recife (Brasilia Time)',
        'America/Rosario' => '(GMT-3:00) America/Rosario (Argentine Time)',
        'America/Santarem' => '(GMT-3:00) America/Santarem (Brasilia Time)',
        'America/Sao_Paulo' => '(GMT-3:00) America/Sao_Paulo (Brasilia Time)',
        'Antarctica/Rothera' => '(GMT-3:00) Antarctica/Rothera (Rothera Time)',
        'Brazil/East' => '(GMT-3:00) Brazil/East (Brasilia Time)',
        'America/Noronha' => '(GMT-2:00) America/Noronha (Fernando de Noronha Time)',
        'Atlantic/South_Georgia' => '(GMT-2:00) Atlantic/South_Georgia (South Georgia Standard Time)',
        'Brazil/DeNoronha' => '(GMT-2:00) Brazil/DeNoronha (Fernando de Noronha Time)',
        'America/Scoresbysund' => '(GMT-1:00) America/Scoresbysund (Eastern Greenland Time)',
        'Atlantic/Azores' => '(GMT-1:00) Atlantic/Azores (Azores Time)',
        'Atlantic/Cape_Verde' => '(GMT-1:00) Atlantic/Cape_Verde (Cape Verde Time)',
        'Africa/Abidjan' => '(GMT+0:00) Africa/Abidjan (Greenwich Mean Time)',
        'Africa/Accra' => '(GMT+0:00) Africa/Accra (Ghana Mean Time)',
        'Africa/Bamako' => '(GMT+0:00) Africa/Bamako (Greenwich Mean Time)',
        'Africa/Banjul' => '(GMT+0:00) Africa/Banjul (Greenwich Mean Time)',
        'Africa/Bissau' => '(GMT+0:00) Africa/Bissau (Greenwich Mean Time)',
        'Africa/Casablanca' => '(GMT+0:00) Africa/Casablanca (Western European Time)',
        'Africa/Conakry' => '(GMT+0:00) Africa/Conakry (Greenwich Mean Time)',
        'Africa/Dakar' => '(GMT+0:00) Africa/Dakar (Greenwich Mean Time)',
        'Africa/El_Aaiun' => '(GMT+0:00) Africa/El_Aaiun (Western European Time)',
        'Africa/Freetown' => '(GMT+0:00) Africa/Freetown (Greenwich Mean Time)',
        'Africa/Lome' => '(GMT+0:00) Africa/Lome (Greenwich Mean Time)',
        'Africa/Monrovia' => '(GMT+0:00) Africa/Monrovia (Greenwich Mean Time)',
        'Africa/Nouakchott' => '(GMT+0:00) Africa/Nouakchott (Greenwich Mean Time)',
        'Africa/Ouagadougou' => '(GMT+0:00) Africa/Ouagadougou (Greenwich Mean Time)',
        'Africa/Sao_Tome' => '(GMT+0:00) Africa/Sao_Tome (Greenwich Mean Time)',
        'Africa/Timbuktu' => '(GMT+0:00) Africa/Timbuktu (Greenwich Mean Time)',
        'America/Danmarkshavn' => '(GMT+0:00) America/Danmarkshavn (Greenwich Mean Time)',
        'Atlantic/Canary' => '(GMT+0:00) Atlantic/Canary (Western European Time)',
        'Atlantic/Faeroe' => '(GMT+0:00) Atlantic/Faeroe (Western European Time)',
        'Atlantic/Faroe' => '(GMT+0:00) Atlantic/Faroe (Western European Time)',
        'Atlantic/Madeira' => '(GMT+0:00) Atlantic/Madeira (Western European Time)',
        'Atlantic/Reykjavik' => '(GMT+0:00) Atlantic/Reykjavik (Greenwich Mean Time)',
        'Atlantic/St_Helena' => '(GMT+0:00) Atlantic/St_Helena (Greenwich Mean Time)',
        'Europe/Belfast' => '(GMT+0:00) Europe/Belfast (Greenwich Mean Time)',
        'Europe/Dublin' => '(GMT+0:00) Europe/Dublin (Greenwich Mean Time)',
        'Europe/Guernsey' => '(GMT+0:00) Europe/Guernsey (Greenwich Mean Time)',
        'Europe/Isle_of_Man' => '(GMT+0:00) Europe/Isle_of_Man (Greenwich Mean Time)',
        'Europe/Jersey' => '(GMT+0:00) Europe/Jersey (Greenwich Mean Time)',
        'Europe/Lisbon' => '(GMT+0:00) Europe/Lisbon (Western European Time)',
        'Europe/London' => '(GMT+0:00) Europe/London (Greenwich Mean Time)',
        'Africa/Algiers' => '(GMT+1:00) Africa/Algiers (Central European Time)',
        'Africa/Bangui' => '(GMT+1:00) Africa/Bangui (Western African Time)',
        'Africa/Brazzaville' => '(GMT+1:00) Africa/Brazzaville (Western African Time)',
        'Africa/Ceuta' => '(GMT+1:00) Africa/Ceuta (Central European Time)',
        'Africa/Douala' => '(GMT+1:00) Africa/Douala (Western African Time)',
        'Africa/Kinshasa' => '(GMT+1:00) Africa/Kinshasa (Western African Time)',
        'Africa/Lagos' => '(GMT+1:00) Africa/Lagos (Western African Time)',
        'Africa/Libreville' => '(GMT+1:00) Africa/Libreville (Western African Time)',
        'Africa/Luanda' => '(GMT+1:00) Africa/Luanda (Western African Time)',
        'Africa/Malabo' => '(GMT+1:00) Africa/Malabo (Western African Time)',
        'Africa/Ndjamena' => '(GMT+1:00) Africa/Ndjamena (Western African Time)',
        'Africa/Niamey' => '(GMT+1:00) Africa/Niamey (Western African Time)',
        'Africa/Porto-Novo' => '(GMT+1:00) Africa/Porto-Novo (Western African Time)',
        'Africa/Tunis' => '(GMT+1:00) Africa/Tunis (Central European Time)',
        'Africa/Windhoek' => '(GMT+1:00) Africa/Windhoek (Western African Time)',
        'Arctic/Longyearbyen' => '(GMT+1:00) Arctic/Longyearbyen (Central European Time)',
        'Atlantic/Jan_Mayen' => '(GMT+1:00) Atlantic/Jan_Mayen (Central European Time)',
        'Europe/Amsterdam' => '(GMT+1:00) Europe/Amsterdam (Central European Time)',
        'Europe/Andorra' => '(GMT+1:00) Europe/Andorra (Central European Time)',
        'Europe/Belgrade' => '(GMT+1:00) Europe/Belgrade (Central European Time)',
        'Europe/Berlin' => '(GMT+1:00) Europe/Berlin (Central European Time)',
        'Europe/Bratislava' => '(GMT+1:00) Europe/Bratislava (Central European Time)',
        'Europe/Brussels' => '(GMT+1:00) Europe/Brussels (Central European Time)',
        'Europe/Budapest' => '(GMT+1:00) Europe/Budapest (Central European Time)',
        'Europe/Copenhagen' => '(GMT+1:00) Europe/Copenhagen (Central European Time)',
        'Europe/Gibraltar' => '(GMT+1:00) Europe/Gibraltar (Central European Time)',
        'Europe/Ljubljana' => '(GMT+1:00) Europe/Ljubljana (Central European Time)',
        'Europe/Luxembourg' => '(GMT+1:00) Europe/Luxembourg (Central European Time)',
        'Europe/Madrid' => '(GMT+1:00) Europe/Madrid (Central European Time)',
        'Europe/Malta' => '(GMT+1:00) Europe/Malta (Central European Time)',
        'Europe/Monaco' => '(GMT+1:00) Europe/Monaco (Central European Time)',
        'Europe/Oslo' => '(GMT+1:00) Europe/Oslo (Central European Time)',
        'Europe/Paris' => '(GMT+1:00) Europe/Paris (Central European Time)',
        'Europe/Podgorica' => '(GMT+1:00) Europe/Podgorica (Central European Time)',
        'Europe/Prague' => '(GMT+1:00) Europe/Prague (Central European Time)',
        'Europe/Rome' => '(GMT+1:00) Europe/Rome (Central European Time)',
        'Europe/San_Marino' => '(GMT+1:00) Europe/San_Marino (Central European Time)',
        'Europe/Sarajevo' => '(GMT+1:00) Europe/Sarajevo (Central European Time)',
        'Europe/Skopje' => '(GMT+1:00) Europe/Skopje (Central European Time)',
        'Europe/Stockholm' => '(GMT+1:00) Europe/Stockholm (Central European Time)',
        'Europe/Tirane' => '(GMT+1:00) Europe/Tirane (Central European Time)',
        'Europe/Vaduz' => '(GMT+1:00) Europe/Vaduz (Central European Time)',
        'Europe/Vatican' => '(GMT+1:00) Europe/Vatican (Central European Time)',
        'Europe/Vienna' => '(GMT+1:00) Europe/Vienna (Central European Time)',
        'Europe/Warsaw' => '(GMT+1:00) Europe/Warsaw (Central European Time)',
        'Europe/Zagreb' => '(GMT+1:00) Europe/Zagreb (Central European Time)',
        'Europe/Zurich' => '(GMT+1:00) Europe/Zurich (Central European Time)',
        'Africa/Blantyre' => '(GMT+2:00) Africa/Blantyre (Central African Time)',
        'Africa/Bujumbura' => '(GMT+2:00) Africa/Bujumbura (Central African Time)',
        'Africa/Cairo' => '(GMT+2:00) Africa/Cairo (Eastern European Time)',
        'Africa/Gaborone' => '(GMT+2:00) Africa/Gaborone (Central African Time)',
        'Africa/Harare' => '(GMT+2:00) Africa/Harare (Central African Time)',
        'Africa/Johannesburg' => '(GMT+2:00) Africa/Johannesburg (South Africa Standard Time)',
        'Africa/Kigali' => '(GMT+2:00) Africa/Kigali (Central African Time)',
        'Africa/Lubumbashi' => '(GMT+2:00) Africa/Lubumbashi (Central African Time)',
        'Africa/Lusaka' => '(GMT+2:00) Africa/Lusaka (Central African Time)',
        'Africa/Maputo' => '(GMT+2:00) Africa/Maputo (Central African Time)',
        'Africa/Maseru' => '(GMT+2:00) Africa/Maseru (South Africa Standard Time)',
        'Africa/Mbabane' => '(GMT+2:00) Africa/Mbabane (South Africa Standard Time)',
        'Africa/Tripoli' => '(GMT+2:00) Africa/Tripoli (Eastern European Time)',
        'Asia/Amman' => '(GMT+2:00) Asia/Amman (Eastern European Time)',
        'Asia/Beirut' => '(GMT+2:00) Asia/Beirut (Eastern European Time)',
        'Asia/Damascus' => '(GMT+2:00) Asia/Damascus (Eastern European Time)',
        'Asia/Gaza' => '(GMT+2:00) Asia/Gaza (Eastern European Time)',
        'Asia/Istanbul' => '(GMT+2:00) Asia/Istanbul (Eastern European Time)',
        'Asia/Jerusalem' => '(GMT+2:00) Asia/Jerusalem (Israel Standard Time)',
        'Asia/Nicosia' => '(GMT+2:00) Asia/Nicosia (Eastern European Time)',
        'Asia/Tel_Aviv' => '(GMT+2:00) Asia/Tel_Aviv (Israel Standard Time)',
        'Europe/Athens' => '(GMT+2:00) Europe/Athens (Eastern European Time)',
        'Europe/Bucharest' => '(GMT+2:00) Europe/Bucharest (Eastern European Time)',
        'Europe/Chisinau' => '(GMT+2:00) Europe/Chisinau (Eastern European Time)',
        'Europe/Helsinki' => '(GMT+2:00) Europe/Helsinki (Eastern European Time)',
        'Europe/Istanbul' => '(GMT+2:00) Europe/Istanbul (Eastern European Time)',
        'Europe/Kaliningrad' => '(GMT+2:00) Europe/Kaliningrad (Eastern European Time)',
        'Europe/Kiev' => '(GMT+2:00) Europe/Kiev (Eastern European Time)',
        'Europe/Mariehamn' => '(GMT+2:00) Europe/Mariehamn (Eastern European Time)',
        'Europe/Minsk' => '(GMT+2:00) Europe/Minsk (Eastern European Time)',
        'Europe/Nicosia' => '(GMT+2:00) Europe/Nicosia (Eastern European Time)',
        'Europe/Riga' => '(GMT+2:00) Europe/Riga (Eastern European Time)',
        'Europe/Simferopol' => '(GMT+2:00) Europe/Simferopol (Eastern European Time)',
        'Europe/Sofia' => '(GMT+2:00) Europe/Sofia (Eastern European Time)',
        'Europe/Tallinn' => '(GMT+2:00) Europe/Tallinn (Eastern European Time)',
        'Europe/Tiraspol' => '(GMT+2:00) Europe/Tiraspol (Eastern European Time)',
        'Europe/Uzhgorod' => '(GMT+2:00) Europe/Uzhgorod (Eastern European Time)',
        'Europe/Vilnius' => '(GMT+2:00) Europe/Vilnius (Eastern European Time)',
        'Europe/Zaporozhye' => '(GMT+2:00) Europe/Zaporozhye (Eastern European Time)',
        'Africa/Addis_Ababa' => '(GMT+3:00) Africa/Addis_Ababa (Eastern African Time)',
        'Africa/Asmara' => '(GMT+3:00) Africa/Asmara (Eastern African Time)',
        'Africa/Asmera' => '(GMT+3:00) Africa/Asmera (Eastern African Time)',
        'Africa/Dar_es_Salaam' => '(GMT+3:00) Africa/Dar_es_Salaam (Eastern African Time)',
        'Africa/Djibouti' => '(GMT+3:00) Africa/Djibouti (Eastern African Time)',
        'Africa/Kampala' => '(GMT+3:00) Africa/Kampala (Eastern African Time)',
        'Africa/Khartoum' => '(GMT+3:00) Africa/Khartoum (Eastern African Time)',
        'Africa/Mogadishu' => '(GMT+3:00) Africa/Mogadishu (Eastern African Time)',
        'Africa/Nairobi' => '(GMT+3:00) Africa/Nairobi (Eastern African Time)',
        'Antarctica/Syowa' => '(GMT+3:00) Antarctica/Syowa (Syowa Time)',
        'Asia/Aden' => '(GMT+3:00) Asia/Aden (Arabia Standard Time)',
        'Asia/Baghdad' => '(GMT+3:00) Asia/Baghdad (Arabia Standard Time)',
        'Asia/Bahrain' => '(GMT+3:00) Asia/Bahrain (Arabia Standard Time)',
        'Asia/Kuwait' => '(GMT+3:00) Asia/Kuwait (Arabia Standard Time)',
        'Asia/Qatar' => '(GMT+3:00) Asia/Qatar (Arabia Standard Time)',
        'Europe/Moscow' => '(GMT+3:00) Europe/Moscow (Moscow Standard Time)',
        'Europe/Volgograd' => '(GMT+3:00) Europe/Volgograd (Volgograd Time)',
        'Indian/Antananarivo' => '(GMT+3:00) Indian/Antananarivo (Eastern African Time)',
        'Indian/Comoro' => '(GMT+3:00) Indian/Comoro (Eastern African Time)',
        'Indian/Mayotte' => '(GMT+3:00) Indian/Mayotte (Eastern African Time)',
        'Asia/Tehran' => '(GMT+3:30) Asia/Tehran (Iran Standard Time)',
        'Asia/Baku' => '(GMT+4:00) Asia/Baku (Azerbaijan Time)',
        'Asia/Dubai' => '(GMT+4:00) Asia/Dubai (Gulf Standard Time)',
        'Asia/Muscat' => '(GMT+4:00) Asia/Muscat (Gulf Standard Time)',
        'Asia/Tbilisi' => '(GMT+4:00) Asia/Tbilisi (Georgia Time)',
        'Asia/Yerevan' => '(GMT+4:00) Asia/Yerevan (Armenia Time)',
        'Europe/Samara' => '(GMT+4:00) Europe/Samara (Samara Time)',
        'Indian/Mahe' => '(GMT+4:00) Indian/Mahe (Seychelles Time)',
        'Indian/Mauritius' => '(GMT+4:00) Indian/Mauritius (Mauritius Time)',
        'Indian/Reunion' => '(GMT+4:00) Indian/Reunion (Reunion Time)',
        'Asia/Kabul' => '(GMT+4:30) Asia/Kabul (Afghanistan Time)',
        'Asia/Aqtau' => '(GMT+5:00) Asia/Aqtau (Aqtau Time)',
        'Asia/Aqtobe' => '(GMT+5:00) Asia/Aqtobe (Aqtobe Time)',
        'Asia/Ashgabat' => '(GMT+5:00) Asia/Ashgabat (Turkmenistan Time)',
        'Asia/Ashkhabad' => '(GMT+5:00) Asia/Ashkhabad (Turkmenistan Time)',
        'Asia/Dushanbe' => '(GMT+5:00) Asia/Dushanbe (Tajikistan Time)',
        'Asia/Karachi' => '(GMT+5:00) Asia/Karachi (Pakistan Time)',
        'Asia/Oral' => '(GMT+5:00) Asia/Oral (Oral Time)',
        'Asia/Samarkand' => '(GMT+5:00) Asia/Samarkand (Uzbekistan Time)',
        'Asia/Tashkent' => '(GMT+5:00) Asia/Tashkent (Uzbekistan Time)',
        'Asia/Yekaterinburg' => '(GMT+5:00) Asia/Yekaterinburg (Yekaterinburg Time)',
        'Indian/Kerguelen' => '(GMT+5:00) Indian/Kerguelen (French Southern & Antarctic Lands Time)',
        'Indian/Maldives' => '(GMT+5:00) Indian/Maldives (Maldives Time)',
        'Asia/Calcutta' => '(GMT+5:30) Asia/Calcutta (India Standard Time)',
        'Asia/Colombo' => '(GMT+5:30) Asia/Colombo (India Standard Time)',
        'Asia/Kolkata' => '(GMT+5:30) Asia/Kolkata (India Standard Time)',
        'Asia/Katmandu' => '(GMT+5:45) Asia/Katmandu (Nepal Time)',
        'Antarctica/Mawson' => '(GMT+6:00) Antarctica/Mawson (Mawson Time)',
        'Antarctica/Vostok' => '(GMT+6:00) Antarctica/Vostok (Vostok Time)',
        'Asia/Almaty' => '(GMT+6:00) Asia/Almaty (Alma-Ata Time)',
        'Asia/Bishkek' => '(GMT+6:00) Asia/Bishkek (Kirgizstan Time)',
        'Asia/Dacca' => '(GMT+6:00) Asia/Dacca (Bangladesh Time)',
        'Asia/Dhaka' => '(GMT+6:00) Asia/Dhaka (Bangladesh Time)',
        'Asia/Novosibirsk' => '(GMT+6:00) Asia/Novosibirsk (Novosibirsk Time)',
        'Asia/Omsk' => '(GMT+6:00) Asia/Omsk (Omsk Time)',
        'Asia/Qyzylorda' => '(GMT+6:00) Asia/Qyzylorda (Qyzylorda Time)',
        'Asia/Thimbu' => '(GMT+6:00) Asia/Thimbu (Bhutan Time)',
        'Asia/Thimphu' => '(GMT+6:00) Asia/Thimphu (Bhutan Time)',
        'Indian/Chagos' => '(GMT+6:00) Indian/Chagos (Indian Ocean Territory Time)',
        'Asia/Rangoon' => '(GMT+6:30) Asia/Rangoon (Myanmar Time)',
        'Indian/Cocos' => '(GMT+6:30) Indian/Cocos (Cocos Islands Time)',
        'Antarctica/Davis' => '(GMT+7:00) Antarctica/Davis (Davis Time)',
        'Asia/Bangkok' => '(GMT+7:00) Asia/Bangkok (Indochina Time)',
        'Asia/Ho_Chi_Minh' => '(GMT+7:00) Asia/Ho_Chi_Minh (Indochina Time)',
        'Asia/Hovd' => '(GMT+7:00) Asia/Hovd (Hovd Time)',
        'Asia/Jakarta' => '(GMT+7:00) Asia/Jakarta (West Indonesia Time)',
        'Asia/Krasnoyarsk' => '(GMT+7:00) Asia/Krasnoyarsk (Krasnoyarsk Time)',
        'Asia/Phnom_Penh' => '(GMT+7:00) Asia/Phnom_Penh (Indochina Time)',
        'Asia/Pontianak' => '(GMT+7:00) Asia/Pontianak (West Indonesia Time)',
        'Asia/Saigon' => '(GMT+7:00) Asia/Saigon (Indochina Time)',
        'Asia/Vientiane' => '(GMT+7:00) Asia/Vientiane (Indochina Time)',
        'Indian/Christmas' => '(GMT+7:00) Indian/Christmas (Christmas Island Time)',
        'Antarctica/Casey' => '(GMT+8:00) Antarctica/Casey (Western Standard Time (Australia))',
        'Asia/Brunei' => '(GMT+8:00) Asia/Brunei (Brunei Time)',
        'Asia/Choibalsan' => '(GMT+8:00) Asia/Choibalsan (Choibalsan Time)',
        'Asia/Chongqing' => '(GMT+8:00) Asia/Chongqing (China Standard Time)',
        'Asia/Chungking' => '(GMT+8:00) Asia/Chungking (China Standard Time)',
        'Asia/Harbin' => '(GMT+8:00) Asia/Harbin (China Standard Time)',
        'Asia/Hong_Kong' => '(GMT+8:00) Asia/Hong_Kong (Hong Kong Time)',
        'Asia/Irkutsk' => '(GMT+8:00) Asia/Irkutsk (Irkutsk Time)',
        'Asia/Kashgar' => '(GMT+8:00) Asia/Kashgar (China Standard Time)',
        'Asia/Kuala_Lumpur' => '(GMT+8:00) Asia/Kuala_Lumpur (Malaysia Time)',
        'Asia/Kuching' => '(GMT+8:00) Asia/Kuching (Malaysia Time)',
        'Asia/Macao' => '(GMT+8:00) Asia/Macao (China Standard Time)',
        'Asia/Macau' => '(GMT+8:00) Asia/Macau (China Standard Time)',
        'Asia/Makassar' => '(GMT+8:00) Asia/Makassar (Central Indonesia Time)',
        'Asia/Manila' => '(GMT+8:00) Asia/Manila (Philippines Time)',
        'Asia/Shanghai' => '(GMT+8:00) Asia/Shanghai (China Standard Time)',
        'Asia/Singapore' => '(GMT+8:00) Asia/Singapore (Singapore Time)',
        'Asia/Taipei' => '(GMT+8:00) Asia/Taipei (China Standard Time)',
        'Asia/Ujung_Pandang' => '(GMT+8:00) Asia/Ujung_Pandang (Central Indonesia Time)',
        'Asia/Ulaanbaatar' => '(GMT+8:00) Asia/Ulaanbaatar (Ulaanbaatar Time)',
        'Asia/Ulan_Bator' => '(GMT+8:00) Asia/Ulan_Bator (Ulaanbaatar Time)',
        'Asia/Urumqi' => '(GMT+8:00) Asia/Urumqi (China Standard Time)',
        'Australia/Perth' => '(GMT+8:00) Australia/Perth (Western Standard Time (Australia))',
        'Australia/West' => '(GMT+8:00) Australia/West (Western Standard Time (Australia))',
        'Australia/Eucla' => '(GMT+8:45) Australia/Eucla (Central Western Standard Time (Australia))',
        'Asia/Dili' => '(GMT+9:00) Asia/Dili (Timor-Leste Time)',
        'Asia/Jayapura' => '(GMT+9:00) Asia/Jayapura (East Indonesia Time)',
        'Asia/Pyongyang' => '(GMT+9:00) Asia/Pyongyang (Korea Standard Time)',
        'Asia/Seoul' => '(GMT+9:00) Asia/Seoul (Korea Standard Time)',
        'Asia/Tokyo' => '(GMT+9:00) Asia/Tokyo (Japan Standard Time)',
        'Asia/Yakutsk' => '(GMT+9:00) Asia/Yakutsk (Yakutsk Time)',
        'Australia/Adelaide' => '(GMT+9:30) Australia/Adelaide (Central Standard Time (South Australia))',
        'Australia/Broken_Hill' => '(GMT+9:30) Australia/Broken_Hill (Central Standard Time (South Australia/New South Wales))',
        'Australia/Darwin' => '(GMT+9:30) Australia/Darwin (Central Standard Time (Northern Territory))',
        'Australia/North' => '(GMT+9:30) Australia/North (Central Standard Time (Northern Territory))',
        'Australia/South' => '(GMT+9:30) Australia/South (Central Standard Time (South Australia))',
        'Australia/Yancowinna' => '(GMT+9:30) Australia/Yancowinna (Central Standard Time (South Australia/New South Wales))',
        'Antarctica/DumontDUrville' => '(GMT+10:00) Antarctica/DumontDUrville (Dumont-d\'Urville Time)',
        'Asia/Sakhalin' => '(GMT+10:00) Asia/Sakhalin (Sakhalin Time)',
        'Asia/Vladivostok' => '(GMT+10:00) Asia/Vladivostok (Vladivostok Time)',
        'Australia/ACT' => '(GMT+10:00) Australia/ACT (Eastern Standard Time (New South Wales))',
        'Australia/Brisbane' => '(GMT+10:00) Australia/Brisbane (Eastern Standard Time (Queensland))',
        'Australia/Canberra' => '(GMT+10:00) Australia/Canberra (Eastern Standard Time (New South Wales))',
        'Australia/Currie' => '(GMT+10:00) Australia/Currie (Eastern Standard Time (New South Wales))',
        'Australia/Hobart' => '(GMT+10:00) Australia/Hobart (Eastern Standard Time (Tasmania))',
        'Australia/Lindeman' => '(GMT+10:00) Australia/Lindeman (Eastern Standard Time (Queensland))',
        'Australia/Melbourne' => '(GMT+10:00) Australia/Melbourne (Eastern Standard Time (Victoria))',
        'Australia/NSW' => '(GMT+10:00) Australia/NSW (Eastern Standard Time (New South Wales))',
        'Australia/Queensland' => '(GMT+10:00) Australia/Queensland (Eastern Standard Time (Queensland))',
        'Australia/Sydney' => '(GMT+10:00) Australia/Sydney (Eastern Standard Time (New South Wales))',
        'Australia/Tasmania' => '(GMT+10:00) Australia/Tasmania (Eastern Standard Time (Tasmania))',
        'Australia/Victoria' => '(GMT+10:00) Australia/Victoria (Eastern Standard Time (Victoria))',
        'Australia/LHI' => '(GMT+10:30) Australia/LHI (Lord Howe Standard Time)',
        'Australia/Lord_Howe' => '(GMT+10:30) Australia/Lord_Howe (Lord Howe Standard Time)',
        'Asia/Magadan' => '(GMT+11:00) Asia/Magadan (Magadan Time)',
        'Antarctica/McMurdo' => '(GMT+12:00) Antarctica/McMurdo (New Zealand Standard Time)',
        'Antarctica/South_Pole' => '(GMT+12:00) Antarctica/South_Pole (New Zealand Standard Time)',
        'Asia/Anadyr' => '(GMT+12:00) Asia/Anadyr (Anadyr Time)',
        'Asia/Kamchatka' => '(GMT+12:00) Asia/Kamchatka (Petropavlovsk-Kamchatski Time)',
    ];
    return $timezonesArr;
}

function shortNumber($n)
{
    if ($n > 0 && $n < 1000) {
        $n_format = floor($n);
        $suffix = '';
    } else if ($n >= 1000 && $n < 1000000) {
        $n_format = floor($n / 1000);
        $suffix = 'K';
    } else if ($n >= 1000000 && $n < 1000000000) {
        $n_format = floor($n / 1000000);
        $suffix = 'M';
    } else if ($n >= 1000000000 && $n < 1000000000000) {
        $n_format = floor($n / 1000000000);
        $suffix = 'B';
    } else if ($n >= 1000000000000) {
        $n_format = floor($n / 1000000000000);
        $suffix = 'T';
    } else {
        $n_format = 0;
        $suffix = '';
    }

    return !empty($n_format . $suffix) ? $n_format . $suffix : 0;
}

function vImageUpload($file, $location, $size = null, $specificName = null, $old = null)
{
    $path = makeDirectory($location);
    if (!empty($old)) {
        removeFile($old);
    }
    if (!empty($specificName)) {
        $filename = $specificName . '.' . $file->getClientOriginalExtension();
    } else {
        $filename = Str::random(15) . '_' . time() . '.' . $file->getClientOriginalExtension();
    }
    $image = Image::make($file);
    if (!empty($size)) {
        $newSize = explode('x', strtolower($size));
        $image->resize($newSize[0], $newSize[1]);
    }
    $image->save($location . $filename);
    return $location . $filename;
}

function vFileUpload($file, $location, $specificName = null, $old = null)
{
    $path = makeDirectory($location);
    if (!empty($old)) {
        removeFile($old);
    }
    if (!empty($specificName)) {
        $filename = $specificName . '.' . $file->getClientOriginalExtension();
    } else {
        $filename = Str::random(15) . '_' . time() . '.' . $file->getClientOriginalExtension();
    }
    $file->move($location, $filename);
    return $location . $filename;
}

function removeFile($path)
{
    if (!file_exists($path)) {
        return true;
    }
    return File::delete($path);
}

function removeDirectory($path)
{
    if (!file_exists($path)) {
        return true;
    }
    return File::deleteDirectory($path);
}

function makeDirectory($path)
{
    if (File::exists($path)) {
        return true;
    }
    return File::makeDirectory($path, 0775, true);
}

function shortertext($text, $chars_limit)
{
    return Str::limit($text, $chars_limit, $end = '...');
}

function setEnv($key, $value)
{
    $path = app()->environmentFilePath();
    $escaped = preg_quote('=' . env($key), '/');
    file_put_contents($path, preg_replace(
        "/^{$key}{$escaped}/m",
        "{$key}={$value}",
        file_get_contents($path)
    ));
}

function removeSpaces($string)
{
    return preg_replace('/\s+/', '', $string);
}

function extensionsStatus($ext)
{
    if ($ext != null) {
        $status = '<span class="badge bg-success">' . __("Active") . '</span>';
    } else {
        $status = '<span class="badge bg-danger">' . __("Disabled") . '</span>';
    }
    return $status;
}

function languages()
{
    $codes = [
        'aa' => 'Afar',
        'ab' => 'Abkhazian',
        'ae' => 'Avestan',
        'af' => 'Afrikaans',
        'ak' => 'Akan',
        'am' => 'Amharic',
        'an' => 'Aragonese',
        'ar' => 'Arabic',
        'as' => 'Assamese',
        'av' => 'Avaric',
        'ay' => 'Aymara',
        'az' => 'Azerbaijani',
        'ba' => 'Bashkir',
        'be' => 'Belarusian',
        'bg' => 'Bulgarian',
        'bh' => 'Bihari languages',
        'bi' => 'Bislama',
        'bm' => 'Bambara',
        'bn' => 'Bengali',
        'bo' => 'Tibetan',
        'br' => 'Breton',
        'bs' => 'Bosnian',
        'ca' => 'Catalan, Valencian',
        'ce' => 'Chechen',
        'ch' => 'Chamorro',
        'co' => 'Corsican',
        'cr' => 'Cree',
        'cs' => 'Czech',
        'cu' => 'Church Slavonic, Old Bulgarian, Old Church Slavonic',
        'cv' => 'Chuvash',
        'cy' => 'Welsh',
        'da' => 'Danish',
        'de' => 'German',
        'dv' => 'Divehi, Dhivehi, Maldivian',
        'dz' => 'Dzongkha',
        'ee' => 'Ewe',
        'el' => 'Greek (Modern)',
        'en' => 'English',
        'eo' => 'Esperanto',
        'es' => 'Spanish, Castilian',
        'et' => 'Estonian',
        'eu' => 'Basque',
        'fa' => 'Persian',
        'ff' => 'Fulah',
        'fi' => 'Finnish',
        'fj' => 'Fijian',
        'fo' => 'Faroese',
        'fr' => 'French',
        'fy' => 'Western Frisian',
        'ga' => 'Irish',
        'gd' => 'Gaelic, Scottish Gaelic',
        'gl' => 'Galician',
        'gn' => 'Guarani',
        'gu' => 'Gujarati',
        'gv' => 'Manx',
        'ha' => 'Hausa',
        'he' => 'Hebrew',
        'hi' => 'Hindi',
        'ho' => 'Hiri Motu',
        'hr' => 'Croatian',
        'ht' => 'Haitian, Haitian Creole',
        'hu' => 'Hungarian',
        'hy' => 'Armenian',
        'hz' => 'Herero',
        'ia' => 'Interlingua (International Auxiliary Language Association)',
        'id' => 'Indonesian',
        'ie' => 'Interlingue',
        'ig' => 'Igbo',
        'ii' => 'Nuosu, Sichuan Yi',
        'ik' => 'Inupiaq',
        'io' => 'Ido',
        'is' => 'Icelandic',
        'it' => 'Italian',
        'iu' => 'Inuktitut',
        'ja' => 'Japanese',
        'jv' => 'Javanese',
        'ka' => 'Georgian',
        'kg' => 'Kongo',
        'ki' => 'Gikuyu, Kikuyu',
        'kj' => 'Kwanyama, Kuanyama',
        'kk' => 'Kazakh',
        'kl' => 'Greenlandic, Kalaallisut',
        'km' => 'Central Khmer',
        'kn' => 'Kannada',
        'ko' => 'Korean',
        'kr' => 'Kanuri',
        'ks' => 'Kashmiri',
        'ku' => 'Kurdish',
        'kv' => 'Komi',
        'kw' => 'Cornish',
        'ky' => 'Kyrgyz',
        'la' => 'Latin',
        'lb' => 'Letzeburgesch, Luxembourgish',
        'lg' => 'Ganda',
        'li' => 'Limburgish, Limburgan, Limburger',
        'ln' => 'Lingala',
        'lo' => 'Lao',
        'lt' => 'Lithuanian',
        'lu' => 'Luba-Katanga',
        'lv' => 'Latvian',
        'mg' => 'Malagasy',
        'mh' => 'Marshallese',
        'mi' => 'Maori',
        'mk' => 'Macedonian',
        'ml' => 'Malayalam',
        'mn' => 'Mongolian',
        'mr' => 'Marathi',
        'ms' => 'Malay',
        'mt' => 'Maltese',
        'my' => 'Burmese',
        'na' => 'Nauru',
        'nb' => 'Norwegian Bokmål',
        'nd' => 'Northern Ndebele',
        'ne' => 'Nepali',
        'ng' => 'Ndonga',
        'nl' => 'Dutch, Flemish',
        'nn' => 'Norwegian Nynorsk',
        'no' => 'Norwegian',
        'nr' => 'South Ndebele',
        'nv' => 'Navajo, Navaho',
        'ny' => 'Chichewa, Chewa, Nyanja',
        'oc' => 'Occitan (post 1500)',
        'oj' => 'Ojibwa',
        'om' => 'Oromo',
        'or' => 'Oriya',
        'os' => 'Ossetian, Ossetic',
        'pa' => 'Panjabi, Punjabi',
        'pi' => 'Pali',
        'pl' => 'Polish',
        'ps' => 'Pashto, Pushto',
        'pt' => 'Portuguese',
        'qu' => 'Quechua',
        'rm' => 'Romansh',
        'rn' => 'Rundi',
        'ro' => 'Moldovan, Moldavian, Romanian',
        'ru' => 'Russian',
        'rw' => 'Kinyarwanda',
        'sa' => 'Sanskrit',
        'sc' => 'Sardinian',
        'sd' => 'Sindhi',
        'se' => 'Northern Sami',
        'sg' => 'Sango',
        'si' => 'Sinhala, Sinhalese',
        'sk' => 'Slovak',
        'sl' => 'Slovenian',
        'sm' => 'Samoan',
        'sn' => 'Shona',
        'so' => 'Somali',
        'sq' => 'Albanian',
        'sr' => 'Serbian',
        'ss' => 'Swati',
        'st' => 'Sotho, Southern',
        'su' => 'Sundanese',
        'sv' => 'Swedish',
        'sw' => 'Swahili',
        'ta' => 'Tamil',
        'te' => 'Telugu',
        'tg' => 'Tajik',
        'th' => 'Thai',
        'ti' => 'Tigrinya',
        'tk' => 'Turkmen',
        'tl' => 'Tagalog',
        'tn' => 'Tswana',
        'to' => 'Tonga (Tonga Islands)',
        'tr' => 'Turkish',
        'ts' => 'Tsonga',
        'tt' => 'Tatar',
        'tw' => 'Twi',
        'ty' => 'Tahitian',
        'ug' => 'Uighur, Uyghur',
        'uk' => 'Ukrainian',
        'ur' => 'Urdu',
        'uz' => 'Uzbek',
        've' => 'Venda',
        'vi' => 'Vietnamese',
        'vo' => 'Volap_k',
        'wa' => 'Walloon',
        'wo' => 'Wolof',
        'xh' => 'Xhosa',
        'yi' => 'Yiddish',
        'yo' => 'Yoruba',
        'za' => 'Zhuang, Chuang',
        'zh' => 'Chinese',
        'zu' => 'Zulu',
    ];
    return $codes;
}

function langURL($lang)
{
    return LaravelLocalization::getLocalizedURL($lang, null, [], true);
}

function getLang()
{
    return LaravelLocalization::getCurrentLocale();
}

function getLangName()
{
    $language = Language::where('code', getLang())->first();
    if (!is_null($language)) {
        return $language->name;
    }
    return LaravelLocalization::getCurrentLocaleName();
}

function getSupportedLocales()
{
    $locales = [];
    foreach (Language::all() as $language) {
        $locales[$language->code] = [
            'name' => $language->name,
        ];
    }
    return $locales;
}

function lang($key, $group = null, $lang = null)
{
    $lang = (is_null($lang)) ? App::getLocale() : $lang;
    $group = (is_null($group)) ? 'general' : $group;
    if (Cache::has($lang . '_' . $group . '_' . $key)) {
        return Cache::get($lang . '_' . $group . '_' . $key);
    }
    $translation = Translate::where('lang', env('DEFAULT_LANGUAGE'))->where('key', $key)->where('group_name', $group)->first();
    if (is_null($translation)) {
        foreach (Language::all() as $language) {
            $translation = new Translate();
            $translation->lang = $language['code'];
            $translation->group_name = strtolower($group);
            $translation->key = $key;
            if ($language['code'] == 'en') {
                $translation->value = $key;
            } else {
                $translation->value = null;
            }
            $translation->save();
        }
    }
    $localTranslate = Translate::where('key', $key)->where('lang', $lang)->where('group_name', $group)->first();
    if (!is_null($localTranslate) && !is_null($localTranslate->value)) {
        Cache::forever($lang . '_' . $group . '_' . $key, $localTranslate->value);
        return $localTranslate->value;
    } elseif (!is_null($translation->value)) {
        Cache::forever($lang . '_' . $group . '_' . $key, $translation->value);
        return $translation->value;
    } else {
        Cache::forever($lang . '_' . $group . '_' . $key, $key);
        return $key;
    }
}

function mailTemplates($key, $group)
{
    $mailTemplate = MailTemplate::where('lang', env('DEFAULT_LANGUAGE'))->where('key', $key)->where('group_name', $group)->first();
    if (is_null($mailTemplate)) {
        foreach (Language::all() as $language) {
            $mailTemplate = new MailTemplate();
            $mailTemplate->lang = $language->code;
            $mailTemplate->group_name = strtolower($group);
            $mailTemplate->key = $key;
            if ($language->code == 'en') {
                $mailTemplate->value = $key;
            } else {
                $mailTemplate->value = null;
            }
            $mailTemplate->save();
        }
    }
    $translateMailTemplate = MailTemplate::where('key', $key)->where('lang', getLang())->where('group_name', $group)->first();
    if (!is_null($translateMailTemplate) && !is_null($translateMailTemplate->value)) {
        return $translateMailTemplate->value;
    } elseif (!is_null($mailTemplate->value)) {
        return $mailTemplate->value;
    } else {
        return $key;
    }
}

function countTicketsByStatus($status)
{
    if (Auth::user()) {
        $totalTickets = SupportTicket::where([['status', $status], ['user_id', userAuthInfo()->id]])->get()->count();
        return $totalTickets;
    } else {
        $totalTickets = SupportTicket::where('status', $status)->get()->count();
        return $totalTickets;
    }
}

function ticketStatus($status)
{
    if ($status == 0) {
        return '<span class="badge bg-primary">' . lang('Opened', 'tickets') . '</span>';
    } elseif ($status == 1) {
        return '<span class="badge bg-success">' . lang('Answered', 'tickets') . '</span>';
    } elseif ($status == 2) {
        return '<span class="badge bg-girl">' . lang('Replied', 'tickets') . '</span>';
    } elseif ($status == 3) {
        return '<span class="badge bg-fire">' . lang('Closed', 'tickets') . '</span>';
    }
    return $status;
}

function ticketPriority($priority)
{
    if ($priority == 0) {
        return '<span class="badge bg-secondary">' . lang('Normal', 'tickets') . '</span>';
    } elseif ($priority == 1) {
        return '<span class="badge bg-warning">' . lang('Low', 'tickets') . '</span>';
    } elseif ($priority == 2) {
        return ' <span class="badge bg-dark">' . lang('High', 'tickets') . '</span>';
    } elseif ($priority == 3) {
        return '<span class="badge bg-danger">' . lang('Urgent', 'tickets') . '</span>';
    }
    return $priority;
}

function allowBr($string)
{
    return str_ireplace("\r\n", "<br/>", $string);
}

function userStatus($status)
{
    if ($status == 0) {
        return '<span class="badge bg-danger">' . __('Banned') . '</span>';
    } elseif ($status == 1) {
        return '<span class="badge bg-success">' . __('Active') . '</span>';
    }
    return $status;
}

function chartDates(Carbon $startDate, Carbon $endDate, $format = 'Y-m-d')
{
    $dates = collect();
    $startDate = $startDate->copy();
    for ($date = $startDate; $date->lte($endDate); $date->addDay()) {
        $dates->put($date->format($format), 0);
    }
    return $dates;
}

function vIpInfo()
{
    $ip = null;
    if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
        $ip = $_SERVER["HTTP_CF_CONNECTING_IP"];
    } else {
        if (filter_var($ip, FILTER_VALIDATE_IP) === false) {
            $ip = $_SERVER["REMOTE_ADDR"];
            if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
                $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            }
            if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP)) {
                $ip = $_SERVER['HTTP_CLIENT_IP'];
            }
        }
    }

    if (Cache::has($ip)) {
        $ipInfo = Cache::get($ip);
    } else {
        $fields = "status,country,countryCode,city,zip,lat,lon,timezone,currency,proxy,query";
        $ipInfo = (object) json_decode(curl_get_file_contents("http://ip-api.com/json/{$ip}?fields={$fields}"), true);
        Cache::forever($ip, $ipInfo);
    }

    $data['ip'] = $ipInfo->query ?? $ip;
    $data['country'] = $ipInfo->country ?? "Unknown";
    $data['country_code'] = $ipInfo->countryCode ?? "Unknown";
    $data['timezone'] = $ipInfo->timezone ?? "Unknown";
    $data['city'] = $ipInfo->city ?? "Unknown";
    $data['zip'] = $ipInfo->zip ?? "Unknown";
    $data['latitude'] = $ipInfo->lat ?? "Unknown";
    $data['longitude'] = $ipInfo->lon ?? "Unknown";
    $data['location'] = $data['city'] . ', ' . $data['country_code'];
    $data['currency'] = $ipInfo->currency ?? "Unknown";
    $data['proxy'] = $ipInfo->proxy ?? "Unknown";

    return (object) $data;
}

function vBrowser()
{
    $agent = $_SERVER['HTTP_USER_AGENT'];
    $browsers = [
        '/msie/i' => 'Internet Explorer',
        '/firefox/i' => 'Firefox',
        '/safari/i' => 'Safari',
        '/chrome/i' => 'Chrome',
        '/edge/i' => 'Edge',
        '/opera/i' => 'Opera',
        '/netscape/i' => 'Netscape',
        '/maxthon/i' => 'Maxthon',
        '/konqueror/i' => 'Konqueror',
        '/mobile/i' => 'Handheld Browser',
    ];
    $agent_browser = "Unknown";
    foreach ($browsers as $key => $value) {
        if (preg_match($key, $agent)) {
            $agent_browser = $value;
        }
    }
    return $agent_browser;
}

function vPlatform()
{
    $agent = $_SERVER['HTTP_USER_AGENT'];
    $platforms = [
        '/windows nt 10/i' => 'Windows 10',
        '/windows nt 6.3/i' => 'Windows 8.1',
        '/windows nt 6.2/i' => 'Windows 8',
        '/windows nt 6.1/i' => 'Windows 7',
        '/windows nt 6.0/i' => 'Windows Vista',
        '/windows nt 5.2/i' => 'Windows Server 2003/XP x64',
        '/windows nt 5.1/i' => 'Windows XP',
        '/windows xp/i' => 'Windows XP',
        '/windows nt 5.0/i' => 'Windows 2000',
        '/windows me/i' => 'Windows ME',
        '/win98/i' => 'Windows 98',
        '/win95/i' => 'Windows 95',
        '/win16/i' => 'Windows 3.11',
        '/macintosh|mac os x/i' => 'Mac OS X',
        '/mac_powerpc/i' => 'Mac OS 9',
        '/linux/i' => 'Linux',
        '/ubuntu/i' => 'Ubuntu',
        '/iphone/i' => 'iPhone',
        '/ipod/i' => 'iPod',
        '/ipad/i' => 'iPad',
        '/android/i' => 'Android',
        '/blackberry/i' => 'BlackBerry',
        '/webos/i' => 'Mobile',
    ];
    $agent_platform = "Unknown";
    foreach ($platforms as $key => $value) {
        if (preg_match($key, $agent)) {
            $agent_platform = $value;
        }
    }
    return $agent_platform;
}

function adminNotify($title, $image, $link = null)
{
    $notify = new AdminNotification();
    $notify->title = $title;
    $notify->image = $image;
    $notify->link = $link;
    $notify->save();
}

function userNotify($id, $title, $image, $link = null)
{
    $notify = new UserNotification();
    $notify->user_id = $id;
    $notify->title = $title;
    $notify->image = $image;
    $notify->link = $link;
    $notify->save();
}

function hashid($id)
{
    $hashids = new Hashids('', 12);
    return $hashids->encode($id);
}

function unhashid($id)
{
    $hashids = new Hashids('', 12);
    return $hashids->decode($id);
}

function currencies()
{
    $currency_list = [
        0 => ["name" => "Australian Dollar", "code" => "AUD", "symbol" => "$"],
        1 => ["name" => "British Pound Sterling", "code" => "GBP", "symbol" => "£"],
        2 => ["name" => "Canadian Dollar", "code" => "CAD", "symbol" => "$"],
        3 => ["name" => "Czech Republic Koruna", "code" => "CZK", "symbol" => "Kč"],
        4 => ["name" => "Euro", "code" => "EUR", "symbol" => "€"],
        5 => ["name" => "US Dollar", "code" => "USD", "symbol" => "$"],
    ];
    return $currency_list;
}

function currencyCode()
{
    return currencies()[settings('website_currency')]['code'];
}

function currencySymbol()
{
    $currency = currencies()[settings('website_currency')];
    return $currency['symbol'];
}

function currencySymbolAndCode()
{
    $currency = currencies()[settings('website_currency')];
    return $currency['symbol'] . ' ' . $currency['code'];
}

function price($price)
{
    return number_format($price, 2);
}

function priceSymbol($price)
{
    return number_format($price, 2) . ' ' . currencySymbolAndCode();
}

function priceFormt($price)
{
    return number_format((float) $price, 2, '.', '');
}

function formatBytes($bytes)
{
    if ($bytes >= 1099511627776) {
        $bytes = number_format($bytes / 1099511627776, 2) . ' ' . lang('TB');
    } elseif ($bytes >= 1073741824) {
        $bytes = number_format($bytes / 1073741824, 2) . ' ' . lang('GB');
    } elseif ($bytes >= 1048576) {
        $bytes = number_format($bytes / 1048576, 2) . ' ' . lang('MB');
    } elseif ($bytes >= 1024) {
        $bytes = number_format($bytes / 1024, 2) . ' ' . lang('KB');
    } elseif ($bytes > 1) {
        $bytes = $bytes . ' ' . lang('bytes');
    } elseif ($bytes == 1) {
        $bytes = $bytes . ' ' . lang('byte');
    } else {
        $bytes = '0 ' . lang('bytes');
    }

    return $bytes;
}

function randomCode($length = 12)
{
    $characters = 'ABCDEFGHJKMNOPQRSTUVWXYZ123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function countryTax($countryName)
{
    $country = Country::where('name', $countryName)->first();
    if (is_null($country)) {
        $country = Country::where('code', vIpInfo()->country_code)->first();
    }
    if (!is_null($country)) {
        $tax = Tax::where('country_id', $country->id)->first();
        if (is_null($tax)) {
            $tax = Tax::whereNull('country_id')->first();
            $tax = (is_null($tax)) ? 0 : $tax->percentage;
        } else {
            $tax = $tax->percentage;
        }
    } else {
        $tax = Tax::whereNull('country_id')->first();
        $tax = (is_null($tax)) ? 0 : $tax->percentage;
    }
    return $tax;
}

function paymentGateway($symbol)
{
    $paymentGateway = PaymentGateway::where('symbol', $symbol)->first();
    return $paymentGateway;
}

function planButton($plan)
{
    $button = '';
    $buttonClass = ($plan->price == 0) ? 'btn-outline-secondary' : 'btn-secondary';
    if (auth()->user() or $plan->auth) {
        if (auth()->user() && !is_null(userAuthInfo()->subscription) &&
            $plan->id == userAuthInfo()->subscription->plan->id && userAuthInfo()->subscription->plan->price == 0 ||
            auth()->user() && !is_null(userAuthInfo()->subscription) &&
            $plan->id == userAuthInfo()->subscription->plan->id && $plan->interval == 2) {
            $button = '';
        } else {
            $buttonText = lang('Choose Plan', 'plans');
            $type = "subscribe";
            if (Auth::user()) {
                $subscription = Subscription::where([['user_id', userAuthInfo()->id]])->first();
                if (!is_null($subscription)) {
                    if ($plan->id == $subscription->plan_id) {
                        $buttonText = lang('Renew plan', 'plans');
                        $type = "renew";
                        $buttonClass = "btn-primary";
                    } else {
                        $buttonText = lang('Upgrade plan', 'plans');
                        $type = "upgrade";
                    }
                }
            }
            $confirmClass = (Auth::user()) ? 'vr__confirm__action__form' : '';
            $url = route('subscribe', [hashid($plan->id), $type]);
            $token = csrf_token();
            $button = '<div class="plan-action"><form action="' . $url . '" method="POST"><input type="hidden" name="_token" value="' . $token . '"><button type="submit" class="btn ' . $buttonClass . ' w-100 py-2 ' . $confirmClass . '">' . $buttonText . '</button></form></div>';
        }
    }
    return $button;
}

function planClass($plan_id)
{
    $class = "";
    $plan = Plan::find($plan_id);
    if ($plan->price == 0) {
        if (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
            $class = "plan-current";
        }
    } elseif ($plan->featured_plan) {
        if (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
            $class = "plan-current";
        } else {
            $class = "plan-featured";
        }
    } elseif (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
        $class = "plan-current";
    }
    return $class;
}

function planBadge($plan_id)
{
    $class = "";
    $plan = Plan::find($plan_id);
    if ($plan->price == 0) {
        if (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
            $class = '<div class="plan-badge"><span>' . lang('Your plan', 'plans') . '</span></div>';
        }
    } elseif ($plan->featured_plan) {
        if (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
            $class = '<div class="plan-badge"><span>' . lang('Your plan', 'plans') . '</span></div>';
        } else {
            $class = '<div class="plan-badge"><span>' . lang('Featured', 'plans') . '</span></div>';
        }
    } elseif (Auth::user() && !is_null(userAuthInfo()->subscription) && $plan->id == userAuthInfo()->subscription->plan_id) {
        $class = '<div class="plan-badge"><span>' . lang('Your plan', 'plans') . '</span></div>';
    }
    return $class;
}

function subscription()
{
    $subscription = (Auth::user()) ? SubscriptionManager::registredUserSubscriptionDetails(userAuthInfo()->id) : SubscriptionManager::unregistredUserSubscriptionDetails();
    return $subscription;
}

function subscriptionInterval($interval)
{
    if ($interval == 0) {
        return lang('Monthly', 'plans');
    } elseif ($interval == 1) {
        return lang('Yearly', 'plans');
    } elseif ($interval == 2) {
        return lang('lifetime', 'plans');
    }
}

function featureFirstPlanDetails($feature)
{
    $plan = Plan::where($feature, 1)->select('name', 'color')->first();
    if (is_null($plan)) {
        $plan = (object) [
            'name' => 'Pro',
            'color' => '#000000',
        ];
    }
    return $plan;
}

function timesArr()
{
    $times = [
        "7" => "7 days",
        "30" => "1 Month",
        "180" => "6 Months",
        "364" => "1 Year",
    ];
    return $times;
}

function expiry($date)
{
    $format = Carbon::parse($date);
    if ($format->isPast() == true) {
        return "text-danger";
    } else {
        return "text-success";
    }
}

function isExpiry($date)
{
    if (is_null($date)) {
        return false;
    }
    $format = Carbon::parse($date);
    if ($format->isPast() == true) {
        return true;
    } else {
        return false;
    }
}

function fileIcon($extension, $class = null)
{
    $extension = $extension ?? '?';
    $template = '<span class="vi vi-file ' . $class . '" data-type="' . substr($extension, 0, 4) . '"></span>';
    return $template;
}

function getFileMimeType($ext)
{
    return FileDetailsDetector::lookupMimeType($ext);
}

function responseHandler($response)
{
    return json_decode(json_encode($response));
}

function generateFileName($file)
{
    $fileExtension = $file->getClientOriginalExtension();
    $fileName = $file->getClientOriginalName();
    $fileNoExt = str_replace('.' . $fileExtension, '', $fileName);
    if (empty($fileNoExt) || empty($fileExtension)) {
        $filename = Str::random(15) . '_' . time();
    } else {
        $filename = Str::random(15) . '_' . time() . '.' . strtolower($fileExtension);
    }
    return $filename;
}

function isAddonActive($symbol)
{
    $addon = Addon::where([['symbol', $symbol], ['status', 1]])->first();
    if (!is_null($addon)) {
        return true;
    }
    return false;
}
