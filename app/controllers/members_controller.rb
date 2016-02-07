class MembersController < ApplicationController
  before_filter :authenticate_team
  before_filter :fetch_team
  before_filter :fetch_member, only: [:edit, :update, :destroy]
  before_filter :build_member, only: [:new, :create]

  def index
    @members = @team.members.all
  end

  def new; end

  def create
    if @member.save
      redirect_to team_members_path(@team), notice: 'You have successfully created new member'
    else
      puts @member.errors.full_messages
      render :new, error: 'Please fix the following errors'
    end
  end

  def edit; end

  def update
    if @member.update_attributes(params[:member])
      redirect_to team_members_path(@team), notice: 'You have successfully updated member'
    else
      render :edit, error: 'Please fix the errors'
    end
  end

  def destroy
    if @member.destroy
      flash[:notice] = "You have successfully deleted member #{@member.name}"
    else
      flash[:error] = "Something went wrong! Please try again after some time."
    end

    redirect_to team_members_path(@team)
  end

  private

    def fetch_team
      @team = Team.find(params[:team_id])
    end

    def fetch_member
      @member = @team.members.find(params[:id])
    end

    def build_member
      @member = @team.members.new(params[:member])
    end
end
