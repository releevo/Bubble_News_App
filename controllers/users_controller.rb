class UsersController < ApplicationController

    def create
        @user = User.new(params[:user])
        # need to change this to new story.

        respond_to do |format|
            if @user.save
                UserMailer.notification_email(@user).deliver

                format.html { redirect_to(@user, notice: "Story was successfully created.")}
                format.json {render json: @user, status: :created, location: @user}
            else
                format.html {render action: 'new'}
                format.json { render json: @user.errors, status: :unprocessable_entity}
            end
        end
    end
end
