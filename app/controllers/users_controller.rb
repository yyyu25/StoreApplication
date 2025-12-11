class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy edit_name ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @fullname = @user.first_name + @user.last_name
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def edit_name
    if @user.update(name_params)
      redirect_to @user, notice: "User name updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to shopper_index_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if params[:user][:card_number].present?
      num = params[:user][:card_number].gsub(/\D/, "")
      @user.card_last4digits = num[-4..]
      @user.pay_type = "credit card"
    end
  
    if @user.update(user_params)
      redirect_to params[:return_to] || user_path(@user), notice: "Profile updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to shopper_index_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation, :address, :pay_type, :phone)
    end

    def name_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
