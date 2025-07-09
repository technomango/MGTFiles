<?php

namespace App\Http\Controllers\Frontend\Storage;

use App\Http\Controllers\Controller;
use Exception;
use Storage;

class WasabiController extends Controller
{
    public static function setCredentials($data)
    {
        setEnv('WAS_ACCESS_KEY_ID', $data->credentials->access_key_id);
        setEnv('WAS_SECRET_ACCESS_KEY', $data->credentials->secret_access_key);
        setEnv('WAS_DEFAULT_REGION', $data->credentials->default_region);
        setEnv('WAS_BUCKET', $data->credentials->bucket);
    }

    public static function upload($file, $location)
    {
        try {
            $filename = generateFileName($file);
            $path = $location . $filename;
            $disk = Storage::disk('wasabi');
            $uploadToStorage = $disk->put($path, fopen($file, 'r+'));
            if ($uploadToStorage) {
                $data = [
                    "type" => "success",
                    "filename" => $filename,
                    "path" => $path,
                ];
                return responseHandler($data);
            }
        } catch (Exception $e) {
            return responseHandler(["type" => "error", 'msg' => lang('Storage provider error', 'upload zone')]);
        }
    }

    public static function download($transferFile)
    {
        try {
            $disk = Storage::disk('wasabi');
            $filePath = $disk->path($transferFile->path);
            if ($disk->has($filePath)) {
                return $disk->temporaryUrl($filePath, now()->addHour(), [
                    'ResponseContentDisposition' => 'attachment; filename="' . $transferFile->name . '"',
                ]);
            } else {
                throw new Exception(lang('There was a problem while trying to download the file', 'download page'));
            }
        } catch (Exception $e) {
            throw new Exception(lang('There was a problem while trying to download the file', 'download page'));
        }
    }

    public static function delete($filePath)
    {
        $disk = Storage::disk('wasabi');
        if ($disk->has($filePath)) {
            $disk->delete($filePath);
        }
        return true;
    }
}
