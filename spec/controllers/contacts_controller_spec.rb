require 'spec_helper'
require 'tempfile'

describe ContactsController do

  # This should return the minimal set of attributes required to create a valid
  # Contact. As you add validations to Contact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:contact) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContactsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "GET index" do
    it "assigns all contacts as @contacts" do
      contact = Contact.create! valid_attributes
      get :index, {}, valid_session
      assigns(:contacts).should eq([contact])
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @contact" do
      contact = Contact.create! valid_attributes
      get :show, {:id => contact.to_param}, valid_session
      assigns(:contact).should eq(contact)
    end
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      get :new, {}, valid_session
      assigns(:contact).should be_a_new(Contact)
    end
  end

  describe "GET edit" do
    it "assigns the requested contact as @contact" do
      contact = Contact.create! valid_attributes
      get :edit, {:id => contact.to_param}, valid_session
      assigns(:contact).should eq(contact)
    end
  end

  describe "POST import" do

    it "uploads a valid csv file" do

      csv_rows = <<-eos
first_name,last_name,email_address
lucas,hardbarger,lucas@hardbarger.com
jennifer,hardbarger,jenniferhardbarger@gmail.com
      eos
      file = Tempfile.new('updated_contacts.csv')
      file.write csv_rows
      file.rewind

      expect {
        post :import, :file => Rack::Test::UploadedFile.new(file, 'text/csv')
      }.to change(Contact, :count).by(2)
      response.should redirect_to(import_url)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, {:contact => valid_attributes}, valid_session
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, {:contact => valid_attributes}, valid_session
        assigns(:contact).should be_a(Contact)
        assigns(:contact).should be_persisted
      end

      it "redirects to the created contact" do
        post :create, {:contact => valid_attributes}, valid_session
        response.should redirect_to(Contact.last)
      end
    end

    describe "with valid interest ids" do
      describe "creates a new contact" do

        before :each do
          Interest.create! :name => "test 1"
          Inteerst.create! :name => "test 2"
        end
      end
      describe "updates an existing contact" do

      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        post :create, {:contact => { "first_name" => "invalid value" }}, valid_session
        assigns(:contact).should be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        post :create, {:contact => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        # Assuming there are no other contacts in the database, this
        # specifies that the Contact created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Contact.any_instance.should_receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => contact.to_param, :contact => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested contact as @contact" do
        contact = Contact.create! valid_attributes
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        assigns(:contact).should eq(contact)
      end

      it "redirects to the contact" do
        contact = Contact.create! valid_attributes
        put :update, {:id => contact.to_param, :contact => valid_attributes}, valid_session
        response.should redirect_to(contact)
      end
    end

    describe "with invalid params" do
      it "assigns the contact as @contact" do
        contact = Contact.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        put :update, {:id => contact.to_param, :contact => { "first_name" => "invalid value" }}, valid_session
        assigns(:contact).should eq(contact)
      end

      it "re-renders the 'edit' template" do
        contact = Contact.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contact.any_instance.stub(:save).and_return(false)
        put :update, {:id => contact.to_param, :contact => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contact" do
      contact = Contact.create! valid_attributes
      expect {
        delete :destroy, {:id => contact.to_param}, valid_session
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = Contact.create! valid_attributes
      delete :destroy, {:id => contact.to_param}, valid_session
      response.should redirect_to(contacts_url)
    end
  end

end
