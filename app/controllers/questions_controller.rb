class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :check_answer]

  def show
    @user_answer = ""
  end

  def check_answer
    user_answer = params[:user_answer]
    if user_answer.downcase == @question.answer.downcase
      flash[:notice] = "正解です！"
    else
      flash[:alert] = "不正解です。正解は「#{@question.answer}」です。"
    end
    redirect_to action: :show
  end

  private

  def set_question
    @question = Question.order("RANDOM()").first
  end
end
