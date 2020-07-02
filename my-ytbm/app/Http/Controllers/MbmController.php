<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Bookmark;
use App\Program;

class MbmController extends Controller
{
    public function index($share_token)
    {
        $bookmark = Bookmark::where('share_token', $share_token)->get()[0];
        return view('mbm.index', ['bookmark' => $bookmark]);
    }

    public function get_programs($id) {
        $programs = Program::where('bookmark_id', $id)->get();
        
        foreach ($programs as $program) {
            $program->youtube_url = self::convert_youtube_url($program->youtube_url);
        }
        
        return $programs->toArray();
    }

    private function convert_youtube_url($url) {
        $pattern = "/^https?:\/\/www\.youtube\.com\/watch\?v=(.+)/";
        preg_match($pattern, $url, $result);
        if ($result) {
            return $result[1];
        }

        $pattern = "/^https?:\/\/youtu\.be\/(.+)/";
        preg_match($pattern, $url, $result);
        if ($result) {
            return $result[1];
        }

        return $url;

    }
}
