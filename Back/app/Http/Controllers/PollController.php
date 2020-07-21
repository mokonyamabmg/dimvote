<?php

namespace App\Http\Controllers;

use App\Poll;
use App\Option;
use Carbon\Carbon;
use JWTAuth;
use Illuminate\Http\Request;

class PollController extends Controller
{

    public function getArchivedPolls()
    {
        $archivedPolls = Poll::archived()->get();

        return response()->json($archivedPolls);
    }

    public function getUpcomingPolls()
    {
        $upcomingPolls = Poll::upcoming()->get();

        return response()->json($upcomingPolls, 200);
    }

    public function getCurrentPoll()
    {
        $currentPoll = Poll::current()->first();

        return response()->json($currentPoll, 200);
    }

    public function getPoll($id)
    {
        $poll = Poll::findOrFail($id);
        
        return response()->json($poll, 200);
    }

    public function createPoll(Request $request)
    {

        
        
        //checks for token validity
        if(!$user = JWTAuth::parseToken()->authenticate())
        {
            return response()->json([
                'message' => 'User Not Found'
            ], 404);
        }


        $this->validate($request, [
            'topic' => 'required',
            'description' => 'required',
            'userId' => 'required'
        ]);

        $user = JWTAuth::parseToken()->toUser();
        
        $lastpoll = Poll::all()->last();
        
        $start_date = $lastpoll->end_date;
        $end_date = Carbon::parse($lastpoll->end_date)->addDays(7)->toDateString();
        
        $poll = new Poll();

        $poll->topic = $request->topic;
        $poll->description = $request->description;
        $poll->start_date = $start_date;
        $poll->end_date = $end_date;
        $poll->user_id = $request->userId;
        $poll->created_at = Carbon::now();
        
        $poll->save();

        $optionModels = [];
            foreach ($request->options as $option) {
                $objOption = new Option();
                $objOption->title = $option;
                $objOption->poll_id = $poll->id;
                $objOption->save();
            }

        return response()->json([
            'message' => 'Poll Created Successfully'
        ],200);
    }

    public function getUserPolls($id)
    {
        $polls = Poll::where('user_id', $id)->get();



        return response()->json([
            'user_polls' => $polls
        ], 200);
    }

  

}
