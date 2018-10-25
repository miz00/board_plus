class MyThreads::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  # GET my_thread/:my_thread_id/comments/
  def index
    @my_thread = MyThread.find(params[:my_thread_id])
    @comments = Comment.where(my_thread_id: @my_thread)
  end

  # GET /my_threads/:my_thread_id/comments/new
  def new
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end
  
  #POST /my_threads/:my_thread_id/comments
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new(comment_param)

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to my_thread_comments_path(@my_thread), notice: "Comment was successfully created."}
      else
        format.html{ render :new }
      end
    end
  end

  #GET /my_threads/:my_thread_id/comments/:id/edit
  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
  end

  #PATCH/PUT /my_threads/:my_thread_id/comments/:id
  def update
    @my_thread = MyThread.find(params[:my_thread_id])
    respond_to do |format|
      if @comment.update(comment_param)
        format.html { redirect_to my_thread_comments_path(@my_thread), notice: "Comment was successfully updated."}
      else
        format.html { render :edit }
      end
    end
  end

  #DELETE /my_threads/:my_thread_id/comments/:id
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to my_thread_comments_path(params[:my_thread_id], notice: "Comment was successfully destroyed")}
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_param
    params.require(:comment).permit(:comment).merge(my_thread_id: params[:my_thread_id])
  end
end
