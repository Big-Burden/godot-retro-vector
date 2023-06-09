import bpy
op = bpy.context.active_operator

op.filepath = ''
op.convert_lighting_mode = 'SPEC'
op.gltf_export_id = ''
op.export_format = 'GLB'
op.ui_tab = 'GENERAL'
op.export_copyright = ''
op.export_image_format = 'AUTO'
op.export_texture_dir = ''
op.export_jpeg_quality = 75
op.export_keep_originals = False
op.export_texcoords = False
op.export_normals = True
op.export_draco_mesh_compression_enable = False
op.export_draco_mesh_compression_level = 6
op.export_draco_position_quantization = 14
op.export_draco_normal_quantization = 10
op.export_draco_texcoord_quantization = 12
op.export_draco_color_quantization = 10
op.export_draco_generic_quantization = 12
op.export_tangents = False
op.export_materials = 'NONE'
op.export_original_specular = False
op.export_colors = True
op.export_attributes = False
op.use_mesh_edges = True
op.use_mesh_vertices = True
op.export_cameras = False
op.use_selection = True
op.use_visible = False
op.use_renderable = False
op.use_active_collection_with_nested = True
op.use_active_collection = False
op.use_active_scene = False
op.export_extras = False
op.export_yup = True
op.export_apply = True
op.export_animations = True
op.export_frame_range = True
op.export_frame_step = 1
op.export_force_sampling = True
op.export_nla_strips = True
op.export_nla_strips_merged_animation_name = 'Animation'
op.export_def_bones = False
op.export_optimize_animation_size = False
op.export_anim_single_armature = True
op.export_reset_pose_bones = True
op.export_current_frame = False
op.export_skins = True
op.export_all_influences = False
op.export_morph = True
op.export_morph_normal = True
op.export_morph_tangent = False
op.export_lights = False
op.will_save_settings = True
