class ItemsController < ApplicationController

#  respond_to :html, :json
  # GET /items
  # GET /items.json
  def index
   #respond_with @items
   if params[:search]
    @items = Item.search(params[:search]).order("created_at DESC")
   else
    @items = Item.all.order('created_at DESC')
   end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end


  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
   #    Pony.mail(to:  "anabaei@sfu.ca",
    #        from: "amircmpt@gmail.com",
    #        subject:  "Thanks for the signup dear",
     #       via: :smtp,
      #        via_options: {
       #       address: "smtp.gmail.com",
        #      port: "587",
         #     enable_starttls_auto: true,
          #    user_name: "answerawesome",
           #   password: "Sup3r$ecret",
          #    authentication: :plain,
           #   domain: "gmail.com"
           # }
           # )




      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
     @item = Item.find(params[:id])

      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.' 
      else
         render :edit 
      end
  end

  def calendar
  end
  # DELETE /items/1

  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }  
  end
end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :tags, :count, :supplier, :stock, :avatar)
    end
end
