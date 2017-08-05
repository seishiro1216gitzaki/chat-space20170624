require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user ) }
  let(:group) { create(:group) }
  let(:message) { create_list(:message,5) }
  # 作ったユーザでログインする

# メッセージ一覧ページを表示するアクション
    describe 'GET #index' do
# ログインしている場合
      context 'user signed_in' do
        before do
          login_user user
           get :index, params: {group_id: group}
        end
        # アクション内で定義しているインスタンス変数があるか
        it 'assigns the requested message to @message' do
          expect(assigns(:message)).to be_a_new Message
        end
        # アクション内で定義しているインスタンス変数があるか
        it 'assigns the requested group to @group' do
          expect(assigns(:group)).to eq group
        end
        # 該当するビューが描画されているか
        it "renders the :index template" do
          get :index, params: {group_id: group}
          expect(response).to render_template :index
        end
      end
# ログインしていない場合
      context 'user signed_out' do
        before do
          get :index, params: {group_id: group}
        end
        # 意図したビューにリダイレクトできているか
        it "redirect to the view if signed_out" do
          expect(response).to render_template :index
        end
      end
    end
# メッセージを作成するアクション
    describe 'POST #create' do
# ログインしているかつ、保存に成功した場合
      context 'user signed_in and saved message' do
        before do
          login_user user
        end
        # メッセージの保存はできたのか
        it 'saved message' do
          expect{post :create, params: { group_id: group, message: attributes_for(:message) }}.to change(Message, :count).by(1)
        end
        # 意図した画面に遷移しているか
        it 'redirects to messages#index' do
          post :create, params: { group_id: group, message: attributes_for(:message) }
          expect(response).to redirect_to group_messages_path
        end
      end
# ログインしているが、保存に失敗した場合
      context 'user signed_in and failed saving message' do
        before do
          login_user user
        end
        # メッセージの保存は行われなかったか
          it 'unsave the new message' do
            expect{
            post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) }}.to change(Message, :count).by(0)
          end
        # 意図したビューが描画されているか
          it 'redirects to group_messages_path' do
            post :create, params: { group_id: group, message: attributes_for(:message) }
            expect(response).to redirect_to group_messages_path
          end
      end
# ログインしていない場合
      context 'user is not log-in' do
        before do
          get :index, params: {group_id: group}
        end
        # 意図した画面にリダイレクトできているか
          it 'redirects to sign-in page'do
            expect(response).to render_template :index
          end
       end
    end
end
