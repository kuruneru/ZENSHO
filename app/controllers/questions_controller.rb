class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all
    end
  
    def new
      @question = Question.new
    end
  
    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to questions_path, notice: 'Question was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @question = Question.find(params[:id])
    end
  
    private
  
    def set_question
      @question = Question.find(params[:id])
    end
  
    def question_params
      params.require(:question).permit(:content, :answer)
    end

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
