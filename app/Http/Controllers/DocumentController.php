<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Models\documents; // Assurez-vous que c'est le bon chemin

class DocumentController extends Controller
{
    public function upload($id ,Request $request)
{
    $last_diplome = $request->file('last_diploma');
    $passport_pdf_or_img = $request->file('passport_pdf_or_img');
    $two_last_bulletin = $request->file('two_last_bulletin');

    $last_diplome_path = $last_diplome->storeAs('documents', $last_diplome->getClientOriginalName());
    $passport_pdf_or_img_path = $passport_pdf_or_img->storeAs('documents', $passport_pdf_or_img->getClientOriginalName());
    $two_last_bulletin_path = $two_last_bulletin->storeAs('documents', $two_last_bulletin->getClientOriginalName());

    // Save file information to the database
    $document1 = DB::table('documents')->insert(
        [
            'filename' => $last_diplome->getClientOriginalName(),
            'filepath' => $last_diplome_path,
            'user' => $id,
            'created_at' => time()
        ]
    );

    $document2 = DB::table('documents')->insert(
        [
            'filename' => $passport_pdf_or_img->getClientOriginalName(),
            'filepath' => $passport_pdf_or_img_path,
            'user' => $id,
            'created_at' => time()
        ]
    );

    $document3 = DB::table('documents')->insert(
        [
            'filename' => $two_last_bulletin->getClientOriginalName(),
            'filepath' => $two_last_bulletin_path,
            'user' => $id,
            'created_at' => time()
        ]
    );

    if ($document1 && $document2 && $document3) {
        return response()->json(['success'=> true]);
    } else {
        return response()->json(['success'=> false]);
    }
}

    


   /* public function download($id)
    {
        $document = documents::findOrFail($id);
        $path = Storage::path($document->filepath);
        $headers = [
            'Content-Type' => 'application/octet-stream',
            'Content-Disposition' => 'attachment; filename="' . $document->filename . '"',
        ];
        return response()->download($path, $document->filename, $headers);
    } */
}
 