class UsersController < ApplicationController
    # 登録済みのuserデータを編集・更新、参照、削除する場合はアカウントに紐づくuserインスタンスの利用が必要であるため、各アクション実行前に定義
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :login_required, only: [:new, :create]

    def new
        # userインスタンスの新規作成
        @user = User.new
    end

    def create
        # DBへの保存準備としてストロングパラメーターに基づくuserインスタンスの新規作成
        @user = User.new(user_param)
        # DBへuserデータを保存
        if @user.save
            log_in(@user)
            # エラーなく保存できた場合はDB更新の上、タスク一覧画面（tasks#index）へ遷移
            redirect_to user_path(@user), notice: t('.created')
        else
            # エラーがあり保存できなかった場合は新規作成画面に戻る（※ただしGETアクションをやり直さないのでフォームに入力した文字はそのまま）
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        # 既存のuserインスタンスを更新する
        if @user.update(user_param)
            # エラーなく更新できた場合はDB更新の上、アカウント詳細画面（users#show）へ遷移
            redirect_to user_path, notice: t('.updated')
        else
            # エラーがあり更新できなかった場合はアカウント編集画面に戻る（※ただしGETアクションをやり直さないのでフォームに入力した文字はそのまま）
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to tasks_path, notice: t('.destroyed')
    end


    private

    # アカウントが登録済みの場合、アカウントに紐づくuserインスタンスを抽出
    def set_user
        @user = User.find(params[:id])
    end

    #ストロングパラメーターの設定
    def user_param
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
