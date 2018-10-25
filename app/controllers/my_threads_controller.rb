class MyThreadsController < ApplicationController
    before_action :set_my_thread, only: [:show,:edit,:update,:destroy]

    def new
        @my_thread = MyThread.new
    end

    def index
        @my_threads = MyThread.all
    end

    #GET /my_threads/1
    def show
        redirect_to my_thread_comments_path(@my_thread)
    end

    #GET /my_threads/1/edit
    def edit
        @my_thread = MyThread.find(params[:id])
    end

    #POST /my_threads
    def create
        @my_thread = MyThread.new(my_thread_params)

        respond_to do |format|
            if @my_thread.save
                format.html { redirect_to my_threads_path, notice: "My Threads was successfully created."}
            else
                format.html {render :new}
            end
        end
    end
    
    #PATCH/PUT /my_thread/1
    def update
        #htmlのformatをrespond_toで生成して.updateが通れば#index,elseなら#editへ遷移
        respond_to do |format|
            if @my_thread.update(my_thread_params)
                format.html {redirect_to my_threads_path(@my_thread), notice: "My thread was successfully updated."}
            else
                format.html {render :edit} #renderはAction内からViewを呼び出すmethod edit.html.erbを呼ぶ
            end
        end
    end

    #DELETE /my_threads/1
    def destroy
        @my_thread.destroy
        respond_to do |format|
            format.html { redirect_to my_threads_url, notice: "My thread was successfully destroyed."}
        end
    end

    private
    def set_my_thread
        @my_thread = MyThread.find(params[:id])
    end

    #Never trust parameters from internet
    def my_thread_params
        params.require(:my_thread).permit(:title)
    end
end
