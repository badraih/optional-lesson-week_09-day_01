class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(queation_params)
    @question.save!
    redirect_to "/questions"
  end

  private 
  def queation_params
    params.require(:question).permit(:text)
  end

end