<?php

namespace App\Http\Controllers\Frontend\Storage;

use App\Http\Controllers\Controller;
use Exception;
use Storage;

class AmazonController extends Controller
{
    public static function setCredentials($data)
    {
        setEnv('AWS_ACCESS_KEY_ID', $data->credentials->access_key_id);
        setEnv('AWS_SECRET_ACCESS_KEY', $data->credentials->secret_access_key);
        setEnv('AWS_DEFAULT_REGION', $data->credentials->default_region);
        setEnv('AWS_BUCKET', $data->credentials->bucket);
        setEnv('AWS_URL', $data->credentials->url);
    }

    public static function upload($file, $location)
    {
        try {
            $filename = generateFileName($file);
            $path = $location . $filename;
            $disk = Storage::disk('s3');
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
            $disk = Storage::disk('s3');
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
        $disk = Storage::disk('s3');
        if ($disk->has($filePath)) {
            $disk->delete($filePath);
        }
        return true;
    }

}
