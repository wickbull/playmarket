<?php

namespace App\Console\Commands;

use App\Models\BlockIp;
use Illuminate\Console\Command;

class DeleteBlockUsersIp extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:refreshIp';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command for auto upodate block user ip';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
//        $block_ips = BlockIp::all();
//        foreach ($block_ips as $ip){
//
//        }
    }
}
