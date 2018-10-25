class MyThreadsController < ApplicationController
    def new
        @my_thread = MyThread.new
    end

    def index
        @my_threads = MyThread.all
    end

    #GET /my_threads/1
    def show
        #redirect_to path
    end

    #GET /my_threads/1/edit
    def edit
        @my_thread = MyTread.find(params[:id])
    end

    #POST /my_threads
    def create
        @my_thread = Mythread.new(my_thread_params)
        respond_to do |format|
            if @my_thread.save
                format.html { redirect_to my_threads_path, notice: "My Threads was successfully created."}
            else
                format.html {render :new}
            end
        end
    end
    
    def update

    end

    def destroy

    end

    private
    def my_thread_params
        params.require(:my_thread).permit(:title)
    end
end
