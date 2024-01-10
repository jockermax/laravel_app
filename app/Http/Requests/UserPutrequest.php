<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserPutrequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [

            'surname' => 'required',
            'country' => 'required',
            'province' => 'required',
            'phone_number' => 'required',
            'city_of_birth' => 'required',
            'sex' => 'required',
        ];
    }
}
