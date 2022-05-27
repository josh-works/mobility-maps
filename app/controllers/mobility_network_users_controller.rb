class MobilityNetworkUsersController < ApplicationController
  before_action :set_mobility_network_user, only: %i[ show edit update destroy ]

  # GET /mobility_network_users or /mobility_network_users.json
  def index
    @mobility_network_users = MobilityNetworkUser.all
  end

  # GET /mobility_network_users/1 or /mobility_network_users/1.json
  def show
  end

  # GET /mobility_network_users/new
  def new
    @mobility_network_user = MobilityNetworkUser.new
  end

  # GET /mobility_network_users/1/edit
  def edit
  end

  # POST /mobility_network_users or /mobility_network_users.json
  def create
    @mobility_network_user = MobilityNetworkUser.new(mobility_network_user_params)

    respond_to do |format|
      if @mobility_network_user.save
        format.html { redirect_to mobility_network_user_url(@mobility_network_user), notice: "Mobility network user was successfully created." }
        format.json { render :show, status: :created, location: @mobility_network_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mobility_network_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobility_network_users/1 or /mobility_network_users/1.json
  def update
    respond_to do |format|
      if @mobility_network_user.update(mobility_network_user_params)
        format.html { redirect_to mobility_network_user_url(@mobility_network_user), notice: "Mobility network user was successfully updated." }
        format.json { render :show, status: :ok, location: @mobility_network_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mobility_network_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobility_network_users/1 or /mobility_network_users/1.json
  def destroy
    @mobility_network_user.destroy

    respond_to do |format|
      format.html { redirect_to mobility_network_users_url, notice: "Mobility network user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobility_network_user
      @mobility_network_user = MobilityNetworkUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mobility_network_user_params
      params.require(:mobility_network_user).permit(:name, :strava_athlete_id, :email_address)
    end
end
