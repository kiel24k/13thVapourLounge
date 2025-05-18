<?php

namespace App\Http\Controllers;

use App\Models\ContentManagement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ContentManagementController extends Controller
{

    // 'caption',
    // 'details',
    // 'status',
    // 'type',
    // 'image'
    public function getTitle()
    {
        $data = ContentManagement::where('type', 'title_tag')
            ->get();
        return response()->json($data);
    }
    public function updateTitle(Request $request)
    {
        $cms = ContentManagement::find($request->title_id);
        $cms->caption = $request->caption;
        $cms->status = $request->status;
        $cms->type = 'title_tag';

        if ($request->hasFile('image')) {
            $filePath = '/public/storage/cms_image/' . $cms->image;
            if (File::exists($filePath)) {
                file::delete($filePath);
            }
            $image = $request->file('image');
            $fileName = $image->hashName();
            $image->storeAs('/cms_image', $fileName, 'public');
            $cms->image = $fileName;
            $cms->update();
        }
        $cms->update();

        return response()->json($cms);
    }

    public function getPublishedTitleTag()
    {
        $data = ContentManagement::where('type', 'title_tag')
            ->where('status', 'published')
            ->get();
        return response()->json($data);
    }

    //HERO
    public function getHero()
    {
        $data = ContentManagement::where('type', 'hero')
            ->get();
        return response()->json($data);
    }

    public function updateHero(Request $request)
    {

        $cms = ContentManagement::find($request->hero_id);

        $cms->details = $request->details;
        $cms->status = $request->status;
        $cms->type = 'hero';

        if ($request->hasFile('image')) {
            $filePath = '/public/storage/cms_image/' . $cms->image;
            if (File::exists($filePath)) {
                file::delete($filePath);
            }
            $image = $request->file('image');
            $fileName = $image->hashName();
            $image->storeAs('/cms_image', $fileName, 'public');
            $cms->image = $fileName;
            $cms->update();
        }
        $cms->update();
        return response()->json($cms);
    }
    public function getPublishedHero()
    {
        $data = ContentManagement::where('type', 'hero')
            ->where('status', 'published')
            ->get();
        return response()->json($data);







        
    }

    //ABOUT US
    public function submitAboutUs(Request $request)
    {
        $cms = new ContentManagement();
        $cms->caption = $request->caption;
        $cms->details = $request->details;
        $cms->status = $request->status;
        $cms->type = 'about_us';
        $cms->save();
    }
    public function getAboutUs()
    {
        $data = ContentManagement::select('*')->where('type', 'about_us')->orderBy('id', 'DESC')->get();
        return response()->json($data);
    }

    public function updateAboutUs(Request $request)
    {
        $cms = ContentManagement::find($request->id);
        $cms->caption = $request->caption;
        $cms->details = $request->details;
        $cms->status = $request->status;
        $cms->type = 'about_us';
        $cms->save();
    }
    public function deleteAboutUs(Request $request)
    {
        ContentManagement::find($request->id)->delete();
    }

    public function getPublishedAboutUs () {
        $data = ContentManagement::where('type', 'about_us')->where('status', 'published')->get();
        return response()->json($data);
    }

    //Service
    public function submitService(Request $request)
    {
        $cms = new ContentManagement();
        $cms->caption = $request->caption;
        $cms->details = $request->details;
        $cms->status = $request->status;
        $cms->type = 'service';
        $image = $request->file('image');
        $fileName = $image->hashName();
        $image->store('cms_image', 'public');
        $cms->image = $fileName;
        $cms->save();
    }
    public function getService()
    {
        $data = ContentManagement::select('*')->where('type', 'service')->orderBy('id', 'DESC')->get();
        return response()->json($data);
    }
    public function updateService(Request $request)
    {
        $cms = ContentManagement::find($request->id);
        $cms->caption = $request->caption;
        $cms->details = $request->details;
        $cms->status = $request->status;
        $cms->type = 'service';
        if ($request->hasFile('image')) {
            $filePath = '/public/storage/cms_image/' . $cms->image;
            if (File::exists($filePath)) {
                file::delete($filePath);
            }
            $image = $request->file('image');
            $fileName = $image->hashName();
            $image->storeAs('/cms_image', $fileName, 'public');
            $cms->image = $fileName;
            $cms->update();
        }
        $cms->update();
    }
    public function deleteService(Request $request)
    {
        ContentManagement::find($request->id)->delete();
    }

    public function getPublishedService () {
        $data = ContentManagement::where('type', 'service')->where('status', 'published')->get();
        return response()->json($data);
    }
}
