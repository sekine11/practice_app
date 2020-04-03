class QuestionCommentsController < ApplicationController
    def create
        question = Question.find(params[:question_id])
        comment = current_user.question_comments.new(question_comment_params)
        comment.question_id = question.id
        comment.save
        redirect_back(fallback_location: :back)
    end
    
    def destroy
        comment = QuestionComments.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: :back)
    end
    
    private
    def question_comment_params
        params.require(:question_comment).permit(:comment)
    end
end
