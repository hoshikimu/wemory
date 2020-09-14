class ApprovalsController < ApplicationController
  before_action :ensure_correct_approvered?, only: :edit
  before_action :ensure_correct_user?, only: [:post_image_index, :post_image_index_by_category]
  
  def ensure_correct_approvered?
    if !Approval.find_by(approver_id: current_user.id, approvered_id: params[:approvered_id])
      redirect_to top_path
      flash[:alert] = "閲覧権限がありません。"
    end
  end

  def ensure_correct_user?
    if Approval.find_by(approver_id: params[:approver_id], approvered_id: current_user.id).blank?
      redirect_to top_path
      flash[:alert] = "閲覧権限がありません。"
    end
  end

  def search
  end

  def permission
    @user = User.find_by(name: params[:name], email: params[:email])
    if @user == nil
      flash[:danger] = "ユーザーが見つかりません。"
      render :search
    elsif Approval.find_by(approver_id: current_user.id, approvered_id: @user.id)
      flash[:danger] = "#{@user.name}さんは、承認済みです。"
      render :search
    elsif @user.id == current_user.id
      flash[:danger] = "自身は承認できません。"
      render :search
    end
    @new_approval = Approval.new
  end

  def create
    @new_approval = Approval.new
    @new_approval.permission_status = params[:permission_status]
    @new_approval.approver_id = current_user.id
    @new_approval.approvered_id = params[:user_id]
    @user = User.find(@new_approval.approvered_id)
    if @new_approval.save
      @new_approval.create_notification_approve(current_user)
      flash[:success] = "#{@user.name}さんを承認しました！"
      redirect_to top_path
    else
      render :permission
    end
  end

  def index
    @user_selected = params[:selected]
    @approvers = Approval.where(approver_id: current_user.id)
    @approvereds = Approval.where(approvered_id: current_user.id)
  end

  def edit
    @user = User.find(params[:approvered_id])
    @approval = Approval.find_by(approver_id: current_user.id, approvered_id: @user.id)
  end

  def update
    @user = User.find(params[:approvered_id])
    @approval = Approval.find_by(approver_id: current_user.id, approvered_id: @user.id)
    @approval.permission_status = params[:permission_status]
    if @approval.save
      @approval.create_notification_edit_approve(current_user)
      flash[:success] = "#{@user.name}さんの権限を編集しました！"
      redirect_to approvals_search_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:approvered_id])
    @approval = Approval.find_by(approver_id: current_user.id, approvered_id: @user.id)
    if @approval.destroy
      flash[:success] = "#{@user.name}さんの権限を削除しました！"
      redirect_to approvals_search_path
    end
  end

  def post_image_index
    @approver_user_id = params[:approver_id]
    @categories = Category.where(user_id: @approver_user_id)
    @post_images = PostImage.where(user_id: @approver_user_id).page(params[:page]).per(30)
  end

  def post_image_index_by_category
    @approver_user_id = params[:approver_id]
    @categories = Category.where(user_id: @approver_user_id)
    @post_images = PostImage.where(user_id: @approver_user_id, category_id: params[:category_id]).page(params[:page]).per(30)
  end

end
