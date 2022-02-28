module Admin
  class KnowledgeTagsController < ::Admin::BaseController
    before_action :set_knowledge_tag, only: %w[ show edit update destroy ]

    def index
      @knowledge_tags = KnowledgeTag.all
    end

    def show; end

    def edit; end

    def new
      @knowledge_tag = KnowledgeTag.new
    end

    def create
      @knowledge_tag = KnowledgeTag.new(knowledge_tag_params)
      if @knowledge_tag.save
        redirect_to admin_knowledge_tags_path
      else
        render :new
      end
    end

    def update
      if @knowledge_tag = KnowledgeTag.update(knowledge_tag_params)
        redirect_to admin_knowledge_tags_path
      else
        render :edit
      end
    end

    def destroy
      @knowledge_tag.destroy
      redirect_to admin_knowledge_tags_path
    end

    private

    def set_knowledge_tag
      @knowledge_tag = KnowledgeTag.find(params[:id])
    end

    def knowledge_tag_params
      params.require(:knowledge_tag).permit(
        :name
      )
    end
  end
end
