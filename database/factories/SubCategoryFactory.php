<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SubCategory>
 */
class SubCategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->name();
        $slug = str_replace(" ", "-", $name);
        $slug = strtolower($slug);
        return [
            "name" => $name,
            "slug" => $slug,
            "status" => 1,
            "category_id" => rand(6,30)
        ];
    }
}
