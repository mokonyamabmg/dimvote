<?php

namespace App\Http\Controllers;

use JWTAuth;
use App\Poll;
use App\Vote;
use Carbon\Carbon;
use Illuminate\Http\Request;

class VoteController extends Controller
{
    

    public function vote(Request $request)
    {
           //checks for token validity
           if(!$user = JWTAuth::parseToken()->authenticate())
           {
               return response()->json([
                   'message' => 'User Not Found'
               ], 404);
           }
   
   
           $this->validate($request, [
               'user_id' => 'required',
               'poll_id' => 'required',
               'option_id' => 'required',
           ]);

           $vote = new Vote();
           $vote->user_id = $request->user_id;
           $vote->poll_id = $request->poll_id;
           $vote->option_id = $request->option_id;
           $vote->created_at = Carbon::now();
           $vote->updated_at = Carbon::now();

           $vote->save();

           return response()->json([
               'message' => 'Vote Placed Succesfully'
           ],200);

     }

     public function getPollVotes($poll_id, $user_id)
     {

            $poll = Poll::findOrFail($poll_id);
            $userVoted = false;
            $userVotes = Vote::where('poll_id', $poll_id)->where('user_id', $user_id)->get();
            $pollVotes = count(Vote::where('poll_id', $poll_id)->get());
            $pollOptions = $poll->options;
            
            $pollOptionTitles = $pollOptions->map(function ($option, $key) {
                return $option->title;
            });

            $pollOptionVotes = $pollOptions->map(function ($option, $key) {
                return count(Vote::where('option_id', $option->id)->get());
            });

            if((count($userVotes)) >= 1)
            {
                $userVoted = true;
            }

          
            return response()->json([
                'totalVotes' => $pollVotes,
                'userHasVoted' => $userVoted,
                'optionTitles' => $pollOptionTitles->all(),
                'optionsVotes' => $pollOptionVotes->all()
            ],200);

     }

}
