class QuestionsController < ApplicationController
    
    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params)
  	    @question.user_id = current_user.id
      	    if @question.save
            flash[:notice] = "You have creatad Question successfully."
         	redirect_to question_path(@question.id)
            else
            @quenstios = Question.all
            render "index"
            end
    end
    
    def show
        @question = Question.find(params[:id])
    end
    
    def destroy
        question = Question.find(params[:id])
        if question.destroy
          flash[:notice] = "You have destroyed question successfully."
          redirect_to questions_path
        else
          render "index"
        end
    end
    
    def index
        @questions = Question.all
    end
    
    private
    def question_params
        params.require(:question).permit(:subject, :content)
    end
end
