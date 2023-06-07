class EnterpriseApprovalsController < ApplicationController
  before_action :set_enterprise_approval, only: %i[ show edit update destroy reject approve]

  # GET /enterprise_approvals or /enterprise_approvals.json
  def index
    @enterprise_approvals = EnterpriseApproval.all
    @enterprise_approvals = @enterprise_approvals.find_by(approval_name: params[:approval_name]) if params[:approval_name].present?
    @enterprise_approvals = @enterprise_approvals.find_by(enterprise_name: params[:enterprise_name]) if params[:enterprise_name].present?
    @enterprise_approvals = @enterprise_approvals.order(id: :desc).page(params[:page] || 1).per(10)
  end

  # GET /enterprise_approvals/1 or /enterprise_approvals/1.json
  def show
  end

  # GET /enterprise_approvals/new
  def new
    @enterprise_approval = EnterpriseApproval.new
  end

  # GET /enterprise_approvals/1/edit
  def edit
  end

  def reject
    @enterprise_approval.update status: '已拒绝'
    redirect_to enterprise_approval_url(@enterprise_approval), notice: "操作成功"
  end

  def approve
    @enterprise_approval.update status: '已通过'
    redirect_to enterprise_approval_url(@enterprise_approval), notice: "操作成功"
  end

  # POST /enterprise_approvals or /enterprise_approvals.json
  def create
    @enterprise_approval = EnterpriseApproval.new(enterprise_approval_params)

    respond_to do |format|
      if @enterprise_approval.save
        format.html { redirect_to enterprise_approval_url(@enterprise_approval), notice: "Enterprise approval was successfully created." }
        format.json { render :show, status: :created, location: @enterprise_approval }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enterprise_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enterprise_approvals/1 or /enterprise_approvals/1.json
  def update
    respond_to do |format|
      if @enterprise_approval.update(enterprise_approval_params)
        format.html { redirect_to enterprise_approval_url(@enterprise_approval), notice: "Enterprise approval was successfully updated." }
        format.json { render :show, status: :ok, location: @enterprise_approval }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enterprise_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprise_approvals/1 or /enterprise_approvals/1.json
  def destroy
    @enterprise_approval.destroy

    respond_to do |format|
      format.html { redirect_to enterprise_approvals_url, notice: "Enterprise approval was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise_approval
      @enterprise_approval = EnterpriseApproval.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enterprise_approval_params
      params.require(:enterprise_approval).permit(:approval_name, :tel, :status, :enterprise_name, :business_license, :business_processing_license, :food_distribution_license, :warehouse_photos_one, :warehouse_photos_two, :warehouse_photos_three, :status)
    end
end
