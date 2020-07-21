<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getArchivedPolls', 'PollController@getArchivedPolls');
Route::get('/getUpcomingPolls', 'PollController@getUpcomingPolls');
Route::get('/getUserPolls/{id}', 'PollController@getUserPolls');
Route::get('getPoll/{id}', 'PollController@getPoll');
Route::get('/getCurrentPoll', 'PollController@getCurrentPoll');
Route::post('/createPoll', 'PollController@createPoll')->middleware('auth.jwt');
Route::get('getOptions/{id}', 'OptionController@getOptions');
Route::post('/createOptions', 'OptionController@createOptions');
Route::post('/vote', 'VoteController@vote')->middleware('auth.jwt');
Route::get('getPollVotes/{pollId}/{user_id}', 'VoteController@getPollVotes');
// Route::get('getOptionVotes/{id}','VoteController@getOptionVotes');
Route::post('/signUp', 'UserController@signUp');
Route::post('/signIn', 'UserController@signIn');