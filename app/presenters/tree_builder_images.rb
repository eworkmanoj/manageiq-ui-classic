class TreeBuilderImages < TreeBuilder
  has_kids_for ExtManagementSystem, [:x_get_tree_ems_kids]

  include TreeBuilderArchived

  def tree_init_options
    {
      :leaf           => "ManageIQ::Providers::CloudManager::Template",
      :lazy           => true,
      :allow_reselect => true
    }
  end

  def root_options
    {
      :text    => _("Images by Provider"),
      :tooltip => _("All Images by Provider that I can see")
    }
  end

  def x_get_tree_roots(count_only, _options)
    count_only_or_objects_filtered(count_only, EmsCloud, "name", :match_via_descendants => TemplateCloud) +
      count_only_or_objects(count_only, x_get_tree_arch_orph_nodes("Images"))
  end

  def x_get_tree_ems_kids(object, count_only)
    count_only_or_objects_filtered(count_only, [], "name")
  end
end
