<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class WriteDateToFile extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'write-date-to-file';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Write the current date and time to a file';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $date = now()->toDateTimeString();
        $path = storage_path('logs/date_log.txt');

        file_put_contents($path, $date . PHP_EOL, FILE_APPEND);

        $this->info("Date written: $date");
    }
}
