class DocsController < ApplicationController

  def index
    page = params[:page] || 0
    page = 1 if page.to_i < 1
    q = params[:q]

    unless q.nil?
      @docs = Sunspot.search(Doc) do
        keywords(q)
        #order_by(:title, :asc)
        paginate(:page => page.to_i, :per_page => 10)
      end

      @entries = WillPaginate::Collection.create(page, 10) do |pager|
        pager.replace(@docs.results)
        pager.total_entries = @docs.total
      end
    end
  end

  def show
    @doc = Doc.find(params[:id])
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(params[:doc])
    if @doc.save!
      redirect_to docs_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def reindex_solr
    Sunspot.setup(Doc) do
      text :title, :content
      #string :content
    end
    start_time = Time.now.to_f
    Doc.reindex
    end_time = Time.now.to_f
    @spend_time = end_time - start_time
  end

  def rmindex_solr
    Sunspot.remove_all(Doc)
  end

end
