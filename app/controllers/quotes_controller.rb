class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find_by(id: params[:id])

    # html = render_to_string(action: quote_path(@quote), layout: 'application', template: 'quotes/show')
    # kit = PDFKit.new(html)
    # kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
    # send_data(kit.to_pdf, filename: "#{@quote.author}", type: "application/pdf") 
    
    respond_to do |format|
        format.html
        format.pdf
      end 

  

  def download
    # PDFKit.new takes the HTML and any options for wkhtmltopdf
    # run `wkhtmltopdf --extended-help` for a full list of options
    @quote = Quote.find(params[:quote])
    # raise @quote.inspect 
    # html = "<h1>hello world</h1>"
    html = render_to_string(action: quote_path(@quote), layout: 'application', template: 'quotes/show')
    kit = PDFKit.new(html)
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css.scss"
    send_data(kit.to_pdf, filename: "#{@quote.author}", type: "application/pdf") 

  end
end 

  def new
  end

  def create
    @quote = Quote.new
    @quote.content = params[:content]
    @quote.author = params[:author]

    if @quote.save
      redirect_to quotes_url, notice: "Quote created successfully."
    else
      render 'new'
    end
  end

  def edit
    @quote = Quote.find_by(id: params[:id])
  end

  def update
    @quote = Quote.find_by(id: params[:id])
    @quote.content = params[:content]
    @quote.author = params[:author]

    if @quote.save
      redirect_to quotes_url, notice: "Quote updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @quote = Quote.find_by(id: params[:id])
    @quote.destroy

    redirect_to quotes_url, notice: "Quote deleted."
  end
end

