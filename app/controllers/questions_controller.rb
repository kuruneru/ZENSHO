class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all
    end
  
    def new
      @question = Question.new
      redirect-to new_question_path
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

    
end
