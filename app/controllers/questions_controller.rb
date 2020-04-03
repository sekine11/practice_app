class QuestionsController < ApplicationController
    before_action :authenticate_user!, {only: [:new, :create, :destroy]}
    before_action :ensure_correct_user, {only: [:destroy]}
    
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
        @questions_tags = Question.all
        @comment = QuestionComment.new
        @comments = @question.question_comments.order(id: "DESC")
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
      if params[:tag]
        @questions_tags = Question.all.order(id: "DESC")
        @questions = Question.tagged_with(params[:tag]).order(id: "DESC")
      else
        @questions_tags = Question.all.order(id: "DESC")
        @questions = Question.all.order(id: "DESC")
      end
    end
    
    private
    def ensure_correct_user
      @question = Question.find(params[:id])
     if current_user.id != @question.user.id
        redirect_to questions_path
     end
    end
    def question_params
        params.require(:question).permit(:subject, :content, :tag, category_list: [])
    end
end
