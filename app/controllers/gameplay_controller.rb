class GameplayController < ApplicationController


  before_filter :check_session, only: [:actual_challenge_list, :make_challenge, :take_challenge,
                                       :check_challenge_confirmation]
  before_filter :check_challenge, only: [:check_challenge_status, :take_challenge, :check_challenge_confirmation]
  before_filter :check_challenger, only: [:make_challenge, :take_challenge, :check_challenge_confirmation]
  before_filter :check_game, only: [:actual_game_status, :do_next_move, :actual_round_status]
  before_filter :check_round, only: [:do_next_move, :actual_round_status]

  def actual_challenge_list
    # test
    render json: test_challenge_list.to_json
  end

  def check_challenge_status

  end

  def make_challenge
    @max_points = params[:max_points]
    # session_id, challenger - from the triggers

    # test
    challenges = test_challenge_list
    challenges.append({id: 35, timeadded: Time.now.strftime("%T"), challenger: @challenger, points: @max_points})
    render json: challenges.to_json
  end

  def take_challenge
    # session_id, challenger, challenge_id - from the triggers

    res = ''
    # test
    test_challenge_list.each do |e|
      if e[:id].to_i == @challenge_id.to_i
        res = e
        break
      end
    end

    render json: res.to_json
  end

  def check_challenge_approve
    res = {error_message: "Challenge not found"}
    # TODO: generates a new game or returns just created one
    test_challenge_list.each do |e|
       if e[:id].to_i == @challenge_id.to_i
         res = {game_id: SecureRandom.uuid, rival_alias: e.challenger, score_limit: e.points, current_round: 0}
       end
    end

    render json: res.to_json
  end

  def actual_game_status
    # TODO
    res = {game_status: 1, player1_alias: 'user1', player1_score: 10, player2_alias: 'user2', player2_score: 9, current_round: 5}

    render json: res.to_json
  end

  def do_next_move
    @player = params[:player]
    @round_number = params[:round_number]
    @move_index = params[:move_index]
    # TODO

  end

  def actual_round_status
    @round_number = params[:round_number]
    # TODO

  end

  private

    def check_session
      @session_id = params[:session_id]
      # TODO - check the session
    end

    def check_challenge
      @challenge_id = params[:challenge_id]
      # TODO - check the challenge
    end

    def check_challenger
      @challenger = params[:challenger]
      # TODO - check the challenger
    end

    def check_game
      @game = params[:game_id]
      # TODO - check the game
    end

    def check_round
      @round_number = params[:round_number]
      # TODO - check the round
    end

    def test_challenge_list
      [{id: 23, timeadded: Time.now.strftime("%T"), challenger: 'Optimus Prime', points: 25},
       {id: 24, timeadded: Time.now.strftime("%T"), challenger: 'Bently', points: 15},
       {id: 25, timeadded: Time.now.strftime("%T"), challenger: 'Still I am sad', points: 20},
       {id: 26, timeadded: Time.now.strftime("%T"), challenger: '2-tea-2-room-2-2', points: 35}]
    end
end
