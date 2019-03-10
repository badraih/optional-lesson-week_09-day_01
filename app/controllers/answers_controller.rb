class AnswersController < ApplicationController
  before_action :set_answer, only: [ :edit, :update, :vote, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @question = Question.find(params[:q])
    @answers =  @question.answers
    @answer = Answer.new
  end

  def vote
    @answer.update(answer_params)
    redirect_to "/questions/#{params[:q]}/answers"
  end

  def upvote
    @answer.update(answer_params)
    redirect_to "/questions/#{params[:q]}/answers"
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save!
    redirect_to "/questions/#{params[:q]}/answers"
  end

  def update
    @answer.update(answer_params)
    redirect_to "/questions/#{params[:q]}/answers"
  end


  def destroy
    @answer.destroy
    redirect_to "/questions/#{params[:q]}/answers"
  end

  private

    def set_answer
      @answer = Answer.find(params[:a])
    end

    def answer_params
      params.require(:answer).permit(:text, :vote, :question_id)
    end

end
