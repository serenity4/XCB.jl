# Julia wrapper for header: /usr/include/xcb/xcb.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function xcb_char2b_next(i)
    ccall((:xcb_char2b_next,xcb),Void,(Ptr{xcb_char2b_iterator_t},),i)
end

function xcb_char2b_end(i::xcb_char2b_iterator_t)
    ccall((:xcb_char2b_end,xcb),xcb_generic_iterator_t,(xcb_char2b_iterator_t,),i)
end

function xcb_window_next(i)
    ccall((:xcb_window_next,xcb),Void,(Ptr{xcb_window_iterator_t},),i)
end

function xcb_window_end(i::xcb_window_iterator_t)
    ccall((:xcb_window_end,xcb),xcb_generic_iterator_t,(xcb_window_iterator_t,),i)
end

function xcb_pixmap_next(i)
    ccall((:xcb_pixmap_next,xcb),Void,(Ptr{xcb_pixmap_iterator_t},),i)
end

function xcb_pixmap_end(i::xcb_pixmap_iterator_t)
    ccall((:xcb_pixmap_end,xcb),xcb_generic_iterator_t,(xcb_pixmap_iterator_t,),i)
end

function xcb_cursor_next(i)
    ccall((:xcb_cursor_next,xcb),Void,(Ptr{xcb_cursor_iterator_t},),i)
end

function xcb_cursor_end(i::xcb_cursor_iterator_t)
    ccall((:xcb_cursor_end,xcb),xcb_generic_iterator_t,(xcb_cursor_iterator_t,),i)
end

function xcb_font_next(i)
    ccall((:xcb_font_next,xcb),Void,(Ptr{xcb_font_iterator_t},),i)
end

function xcb_font_end(i::xcb_font_iterator_t)
    ccall((:xcb_font_end,xcb),xcb_generic_iterator_t,(xcb_font_iterator_t,),i)
end

function xcb_gcontext_next(i)
    ccall((:xcb_gcontext_next,xcb),Void,(Ptr{xcb_gcontext_iterator_t},),i)
end

function xcb_gcontext_end(i::xcb_gcontext_iterator_t)
    ccall((:xcb_gcontext_end,xcb),xcb_generic_iterator_t,(xcb_gcontext_iterator_t,),i)
end

function xcb_colormap_next(i)
    ccall((:xcb_colormap_next,xcb),Void,(Ptr{xcb_colormap_iterator_t},),i)
end

function xcb_colormap_end(i::xcb_colormap_iterator_t)
    ccall((:xcb_colormap_end,xcb),xcb_generic_iterator_t,(xcb_colormap_iterator_t,),i)
end

function xcb_atom_next(i)
    ccall((:xcb_atom_next,xcb),Void,(Ptr{xcb_atom_iterator_t},),i)
end

function xcb_atom_end(i::xcb_atom_iterator_t)
    ccall((:xcb_atom_end,xcb),xcb_generic_iterator_t,(xcb_atom_iterator_t,),i)
end

function xcb_drawable_next(i)
    ccall((:xcb_drawable_next,xcb),Void,(Ptr{xcb_drawable_iterator_t},),i)
end

function xcb_drawable_end(i::xcb_drawable_iterator_t)
    ccall((:xcb_drawable_end,xcb),xcb_generic_iterator_t,(xcb_drawable_iterator_t,),i)
end

function xcb_fontable_next(i)
    ccall((:xcb_fontable_next,xcb),Void,(Ptr{xcb_fontable_iterator_t},),i)
end

function xcb_fontable_end(i::xcb_fontable_iterator_t)
    ccall((:xcb_fontable_end,xcb),xcb_generic_iterator_t,(xcb_fontable_iterator_t,),i)
end

function xcb_visualid_next(i)
    ccall((:xcb_visualid_next,xcb),Void,(Ptr{xcb_visualid_iterator_t},),i)
end

function xcb_visualid_end(i::xcb_visualid_iterator_t)
    ccall((:xcb_visualid_end,xcb),xcb_generic_iterator_t,(xcb_visualid_iterator_t,),i)
end

function xcb_timestamp_next(i)
    ccall((:xcb_timestamp_next,xcb),Void,(Ptr{xcb_timestamp_iterator_t},),i)
end

function xcb_timestamp_end(i::xcb_timestamp_iterator_t)
    ccall((:xcb_timestamp_end,xcb),xcb_generic_iterator_t,(xcb_timestamp_iterator_t,),i)
end

function xcb_keysym_next(i)
    ccall((:xcb_keysym_next,xcb),Void,(Ptr{xcb_keysym_iterator_t},),i)
end

function xcb_keysym_end(i::xcb_keysym_iterator_t)
    ccall((:xcb_keysym_end,xcb),xcb_generic_iterator_t,(xcb_keysym_iterator_t,),i)
end

function xcb_keycode_next(i)
    ccall((:xcb_keycode_next,xcb),Void,(Ptr{xcb_keycode_iterator_t},),i)
end

function xcb_keycode_end(i::xcb_keycode_iterator_t)
    ccall((:xcb_keycode_end,xcb),xcb_generic_iterator_t,(xcb_keycode_iterator_t,),i)
end

function xcb_button_next(i)
    ccall((:xcb_button_next,xcb),Void,(Ptr{xcb_button_iterator_t},),i)
end

function xcb_button_end(i::xcb_button_iterator_t)
    ccall((:xcb_button_end,xcb),xcb_generic_iterator_t,(xcb_button_iterator_t,),i)
end

function xcb_point_next(i)
    ccall((:xcb_point_next,xcb),Void,(Ptr{xcb_point_iterator_t},),i)
end

function xcb_point_end(i::xcb_point_iterator_t)
    ccall((:xcb_point_end,xcb),xcb_generic_iterator_t,(xcb_point_iterator_t,),i)
end

function xcb_rectangle_next(i)
    ccall((:xcb_rectangle_next,xcb),Void,(Ptr{xcb_rectangle_iterator_t},),i)
end

function xcb_rectangle_end(i::xcb_rectangle_iterator_t)
    ccall((:xcb_rectangle_end,xcb),xcb_generic_iterator_t,(xcb_rectangle_iterator_t,),i)
end

function xcb_arc_next(i)
    ccall((:xcb_arc_next,xcb),Void,(Ptr{xcb_arc_iterator_t},),i)
end

function xcb_arc_end(i::xcb_arc_iterator_t)
    ccall((:xcb_arc_end,xcb),xcb_generic_iterator_t,(xcb_arc_iterator_t,),i)
end

function xcb_format_next(i)
    ccall((:xcb_format_next,xcb),Void,(Ptr{xcb_format_iterator_t},),i)
end

function xcb_format_end(i::xcb_format_iterator_t)
    ccall((:xcb_format_end,xcb),xcb_generic_iterator_t,(xcb_format_iterator_t,),i)
end

function xcb_visualtype_next(i)
    ccall((:xcb_visualtype_next,xcb),Void,(Ptr{xcb_visualtype_iterator_t},),i)
end

function xcb_visualtype_end(i::xcb_visualtype_iterator_t)
    ccall((:xcb_visualtype_end,xcb),xcb_generic_iterator_t,(xcb_visualtype_iterator_t,),i)
end

function xcb_depth_sizeof(_buffer)
    ccall((:xcb_depth_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_depth_visuals(R)
    ccall((:xcb_depth_visuals,xcb),Ptr{xcb_visualtype_t},(Ptr{xcb_depth_t},),R)
end

function xcb_depth_visuals_length(R)
    ccall((:xcb_depth_visuals_length,xcb),Cint,(Ptr{xcb_depth_t},),R)
end

function xcb_depth_visuals_iterator(R)
    ccall((:xcb_depth_visuals_iterator,xcb),xcb_visualtype_iterator_t,(Ptr{xcb_depth_t},),R)
end

function xcb_depth_next(i)
    ccall((:xcb_depth_next,xcb),Void,(Ptr{xcb_depth_iterator_t},),i)
end

function xcb_depth_end(i::xcb_depth_iterator_t)
    ccall((:xcb_depth_end,xcb),xcb_generic_iterator_t,(xcb_depth_iterator_t,),i)
end

function xcb_screen_sizeof(_buffer)
    ccall((:xcb_screen_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_screen_allowed_depths_length(R)
    ccall((:xcb_screen_allowed_depths_length,xcb),Cint,(Ptr{xcb_screen_t},),R)
end

function xcb_screen_allowed_depths_iterator(R)
    ccall((:xcb_screen_allowed_depths_iterator,xcb),xcb_depth_iterator_t,(Ptr{xcb_screen_t},),R)
end

function xcb_screen_next(i)
    ccall((:xcb_screen_next,xcb),Void,(Ptr{xcb_screen_iterator_t},),i)
end

function xcb_screen_end(i::xcb_screen_iterator_t)
    ccall((:xcb_screen_end,xcb),xcb_generic_iterator_t,(xcb_screen_iterator_t,),i)
end

function xcb_setup_request_sizeof(_buffer)
    ccall((:xcb_setup_request_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_setup_request_authorization_protocol_name(R)
    ccall((:xcb_setup_request_authorization_protocol_name,xcb),Cstring,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_authorization_protocol_name_length(R)
    ccall((:xcb_setup_request_authorization_protocol_name_length,xcb),Cint,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_authorization_protocol_name_end(R)
    ccall((:xcb_setup_request_authorization_protocol_name_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_authorization_protocol_data(R)
    ccall((:xcb_setup_request_authorization_protocol_data,xcb),Cstring,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_authorization_protocol_data_length(R)
    ccall((:xcb_setup_request_authorization_protocol_data_length,xcb),Cint,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_authorization_protocol_data_end(R)
    ccall((:xcb_setup_request_authorization_protocol_data_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_setup_request_t},),R)
end

function xcb_setup_request_next(i)
    ccall((:xcb_setup_request_next,xcb),Void,(Ptr{xcb_setup_request_iterator_t},),i)
end

function xcb_setup_request_end(i::xcb_setup_request_iterator_t)
    ccall((:xcb_setup_request_end,xcb),xcb_generic_iterator_t,(xcb_setup_request_iterator_t,),i)
end

function xcb_setup_failed_sizeof(_buffer)
    ccall((:xcb_setup_failed_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_setup_failed_reason(R)
    ccall((:xcb_setup_failed_reason,xcb),Cstring,(Ptr{xcb_setup_failed_t},),R)
end

function xcb_setup_failed_reason_length(R)
    ccall((:xcb_setup_failed_reason_length,xcb),Cint,(Ptr{xcb_setup_failed_t},),R)
end

function xcb_setup_failed_reason_end(R)
    ccall((:xcb_setup_failed_reason_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_setup_failed_t},),R)
end

function xcb_setup_failed_next(i)
    ccall((:xcb_setup_failed_next,xcb),Void,(Ptr{xcb_setup_failed_iterator_t},),i)
end

function xcb_setup_failed_end(i::xcb_setup_failed_iterator_t)
    ccall((:xcb_setup_failed_end,xcb),xcb_generic_iterator_t,(xcb_setup_failed_iterator_t,),i)
end

function xcb_setup_authenticate_sizeof(_buffer)
    ccall((:xcb_setup_authenticate_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_setup_authenticate_reason(R)
    ccall((:xcb_setup_authenticate_reason,xcb),Cstring,(Ptr{xcb_setup_authenticate_t},),R)
end

function xcb_setup_authenticate_reason_length(R)
    ccall((:xcb_setup_authenticate_reason_length,xcb),Cint,(Ptr{xcb_setup_authenticate_t},),R)
end

function xcb_setup_authenticate_reason_end(R)
    ccall((:xcb_setup_authenticate_reason_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_setup_authenticate_t},),R)
end

function xcb_setup_authenticate_next(i)
    ccall((:xcb_setup_authenticate_next,xcb),Void,(Ptr{xcb_setup_authenticate_iterator_t},),i)
end

function xcb_setup_authenticate_end(i::xcb_setup_authenticate_iterator_t)
    ccall((:xcb_setup_authenticate_end,xcb),xcb_generic_iterator_t,(xcb_setup_authenticate_iterator_t,),i)
end

function xcb_setup_sizeof(_buffer)
    ccall((:xcb_setup_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_setup_vendor(R)
    ccall((:xcb_setup_vendor,xcb),Cstring,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_vendor_length(R)
    ccall((:xcb_setup_vendor_length,xcb),Cint,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_vendor_end(R)
    ccall((:xcb_setup_vendor_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_pixmap_formats(R)
    ccall((:xcb_setup_pixmap_formats,xcb),Ptr{xcb_format_t},(Ptr{xcb_setup_t},),R)
end

function xcb_setup_pixmap_formats_length(R)
    ccall((:xcb_setup_pixmap_formats_length,xcb),Cint,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_pixmap_formats_iterator(R)
    ccall((:xcb_setup_pixmap_formats_iterator,xcb),xcb_format_iterator_t,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_roots_length(R)
    ccall((:xcb_setup_roots_length,xcb),Cint,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_roots_iterator(R)
    ccall((:xcb_setup_roots_iterator,xcb),xcb_screen_iterator_t,(Ptr{xcb_setup_t},),R)
end

function xcb_setup_next(i)
    ccall((:xcb_setup_next,xcb),Void,(Ptr{xcb_setup_iterator_t},),i)
end

function xcb_setup_end(i::xcb_setup_iterator_t)
    ccall((:xcb_setup_end,xcb),xcb_generic_iterator_t,(xcb_setup_iterator_t,),i)
end

function xcb_client_message_data_next(i)
    ccall((:xcb_client_message_data_next,xcb),Void,(Ptr{xcb_client_message_data_iterator_t},),i)
end

function xcb_client_message_data_end(i::xcb_client_message_data_iterator_t)
    ccall((:xcb_client_message_data_end,xcb),xcb_generic_iterator_t,(xcb_client_message_data_iterator_t,),i)
end

function xcb_create_window_sizeof(_buffer)
    ccall((:xcb_create_window_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_create_window_checked(c,depth::UInt8,wid::xcb_window_t,parent::xcb_window_t,x::Int16,y::Int16,width::UInt16,height::UInt16,border_width::UInt16,_class::UInt16,visual::xcb_visualid_t,value_mask::UInt32,value_list)
    ccall((:xcb_create_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_window_t,Int16,Int16,UInt16,UInt16,UInt16,UInt16,xcb_visualid_t,UInt32,Ptr{UInt32}),c,depth,wid,parent,x,y,width,height,border_width,_class,visual,value_mask,value_list)
end

function xcb_create_window(c,depth::UInt8,wid::xcb_window_t,parent::xcb_window_t,x::Int16,y::Int16,width::UInt16,height::UInt16,border_width::UInt16,_class::UInt16,visual::xcb_visualid_t,value_mask::UInt32,value_list)
    ccall((:xcb_create_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_window_t,Int16,Int16,UInt16,UInt16,UInt16,UInt16,xcb_visualid_t,UInt32,Ptr{UInt32}),c,depth,wid,parent,x,y,width,height,border_width,_class,visual,value_mask,value_list)
end

function xcb_change_window_attributes_sizeof(_buffer)
    ccall((:xcb_change_window_attributes_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_window_attributes_checked(c,window::xcb_window_t,value_mask::UInt32,value_list)
    ccall((:xcb_change_window_attributes_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt32,Ptr{UInt32}),c,window,value_mask,value_list)
end

function xcb_change_window_attributes(c,window::xcb_window_t,value_mask::UInt32,value_list)
    ccall((:xcb_change_window_attributes,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt32,Ptr{UInt32}),c,window,value_mask,value_list)
end

function xcb_get_window_attributes(c,window::xcb_window_t)
    ccall((:xcb_get_window_attributes,xcb),xcb_get_window_attributes_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_get_window_attributes_unchecked(c,window::xcb_window_t)
    ccall((:xcb_get_window_attributes_unchecked,xcb),xcb_get_window_attributes_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_get_window_attributes_reply(c,cookie::xcb_get_window_attributes_cookie_t,e)
    ccall((:xcb_get_window_attributes_reply,xcb),Ptr{xcb_get_window_attributes_reply_t},(Ptr{xcb_connection_t},xcb_get_window_attributes_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_destroy_window_checked(c,window::xcb_window_t)
    ccall((:xcb_destroy_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_destroy_window(c,window::xcb_window_t)
    ccall((:xcb_destroy_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_destroy_subwindows_checked(c,window::xcb_window_t)
    ccall((:xcb_destroy_subwindows_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_destroy_subwindows(c,window::xcb_window_t)
    ccall((:xcb_destroy_subwindows,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_change_save_set_checked(c,mode::UInt8,window::xcb_window_t)
    ccall((:xcb_change_save_set_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t),c,mode,window)
end

function xcb_change_save_set(c,mode::UInt8,window::xcb_window_t)
    ccall((:xcb_change_save_set,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t),c,mode,window)
end

function xcb_reparent_window_checked(c,window::xcb_window_t,parent::xcb_window_t,x::Int16,y::Int16)
    ccall((:xcb_reparent_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16),c,window,parent,x,y)
end

function xcb_reparent_window(c,window::xcb_window_t,parent::xcb_window_t,x::Int16,y::Int16)
    ccall((:xcb_reparent_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16),c,window,parent,x,y)
end

function xcb_map_window_checked(c,window::xcb_window_t)
    ccall((:xcb_map_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_map_window(c,window::xcb_window_t)
    ccall((:xcb_map_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_map_subwindows_checked(c,window::xcb_window_t)
    ccall((:xcb_map_subwindows_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_map_subwindows(c,window::xcb_window_t)
    ccall((:xcb_map_subwindows,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_unmap_window_checked(c,window::xcb_window_t)
    ccall((:xcb_unmap_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_unmap_window(c,window::xcb_window_t)
    ccall((:xcb_unmap_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_unmap_subwindows_checked(c,window::xcb_window_t)
    ccall((:xcb_unmap_subwindows_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_unmap_subwindows(c,window::xcb_window_t)
    ccall((:xcb_unmap_subwindows,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_configure_window_sizeof(_buffer)
    ccall((:xcb_configure_window_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_configure_window_checked(c,window::xcb_window_t,value_mask::UInt16,value_list)
    ccall((:xcb_configure_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt16,Ptr{UInt32}),c,window,value_mask,value_list)
end

function xcb_configure_window(c,window::xcb_window_t,value_mask::UInt16,value_list)
    ccall((:xcb_configure_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt16,Ptr{UInt32}),c,window,value_mask,value_list)
end

function xcb_circulate_window_checked(c,direction::UInt8,window::xcb_window_t)
    ccall((:xcb_circulate_window_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t),c,direction,window)
end

function xcb_circulate_window(c,direction::UInt8,window::xcb_window_t)
    ccall((:xcb_circulate_window,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t),c,direction,window)
end

function xcb_get_geometry(c,drawable::xcb_drawable_t)
    ccall((:xcb_get_geometry,xcb),xcb_get_geometry_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t),c,drawable)
end

function xcb_get_geometry_unchecked(c,drawable::xcb_drawable_t)
    ccall((:xcb_get_geometry_unchecked,xcb),xcb_get_geometry_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t),c,drawable)
end

function xcb_get_geometry_reply(c,cookie::xcb_get_geometry_cookie_t,e)
    ccall((:xcb_get_geometry_reply,xcb),Ptr{xcb_get_geometry_reply_t},(Ptr{xcb_connection_t},xcb_get_geometry_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_query_tree_sizeof(_buffer)
    ccall((:xcb_query_tree_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_query_tree(c,window::xcb_window_t)
    ccall((:xcb_query_tree,xcb),xcb_query_tree_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_query_tree_unchecked(c,window::xcb_window_t)
    ccall((:xcb_query_tree_unchecked,xcb),xcb_query_tree_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_query_tree_children(R)
    ccall((:xcb_query_tree_children,xcb),Ptr{xcb_window_t},(Ptr{xcb_query_tree_reply_t},),R)
end

function xcb_query_tree_children_length(R)
    ccall((:xcb_query_tree_children_length,xcb),Cint,(Ptr{xcb_query_tree_reply_t},),R)
end

function xcb_query_tree_children_end(R)
    ccall((:xcb_query_tree_children_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_query_tree_reply_t},),R)
end

function xcb_query_tree_reply(c,cookie::xcb_query_tree_cookie_t,e)
    ccall((:xcb_query_tree_reply,xcb),Ptr{xcb_query_tree_reply_t},(Ptr{xcb_connection_t},xcb_query_tree_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_intern_atom_sizeof(_buffer)
    ccall((:xcb_intern_atom_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_intern_atom(c,only_if_exists::UInt8,name_len::UInt16,name)
    ccall((:xcb_intern_atom,xcb),xcb_intern_atom_cookie_t,(Ptr{xcb_connection_t},UInt8,UInt16,Cstring),c,only_if_exists,name_len,name)
end

function xcb_intern_atom_unchecked(c,only_if_exists::UInt8,name_len::UInt16,name)
    ccall((:xcb_intern_atom_unchecked,xcb),xcb_intern_atom_cookie_t,(Ptr{xcb_connection_t},UInt8,UInt16,Cstring),c,only_if_exists,name_len,name)
end

function xcb_intern_atom_reply(c,cookie::xcb_intern_atom_cookie_t,e)
    ccall((:xcb_intern_atom_reply,xcb),Ptr{xcb_intern_atom_reply_t},(Ptr{xcb_connection_t},xcb_intern_atom_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_get_atom_name_sizeof(_buffer)
    ccall((:xcb_get_atom_name_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_atom_name(c,atom::xcb_atom_t)
    ccall((:xcb_get_atom_name,xcb),xcb_get_atom_name_cookie_t,(Ptr{xcb_connection_t},xcb_atom_t),c,atom)
end

function xcb_get_atom_name_unchecked(c,atom::xcb_atom_t)
    ccall((:xcb_get_atom_name_unchecked,xcb),xcb_get_atom_name_cookie_t,(Ptr{xcb_connection_t},xcb_atom_t),c,atom)
end

function xcb_get_atom_name_name(R)
    ccall((:xcb_get_atom_name_name,xcb),Cstring,(Ptr{xcb_get_atom_name_reply_t},),R)
end

function xcb_get_atom_name_name_length(R)
    ccall((:xcb_get_atom_name_name_length,xcb),Cint,(Ptr{xcb_get_atom_name_reply_t},),R)
end

function xcb_get_atom_name_name_end(R)
    ccall((:xcb_get_atom_name_name_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_atom_name_reply_t},),R)
end

function xcb_get_atom_name_reply(c,cookie::xcb_get_atom_name_cookie_t,e)
    ccall((:xcb_get_atom_name_reply,xcb),Ptr{xcb_get_atom_name_reply_t},(Ptr{xcb_connection_t},xcb_get_atom_name_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_change_property_sizeof(_buffer)
    ccall((:xcb_change_property_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_property_checked(c,mode::UInt8,window::xcb_window_t,property::xcb_atom_t,_type::xcb_atom_t,format::UInt8,data_len::UInt32,data)
    ccall((:xcb_change_property_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_atom_t,xcb_atom_t,UInt8,UInt32,Ptr{Void}),c,mode,window,property,_type,format,data_len,data)
end

function xcb_change_property(c,mode::UInt8,window::xcb_window_t,property::xcb_atom_t,_type::xcb_atom_t,format::UInt8,data_len::UInt32,data)
    ccall((:xcb_change_property,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_atom_t,xcb_atom_t,UInt8,UInt32,Ptr{Void}),c,mode,window,property,_type,format,data_len,data)
end

function xcb_delete_property_checked(c,window::xcb_window_t,property::xcb_atom_t)
    ccall((:xcb_delete_property_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t),c,window,property)
end

function xcb_delete_property(c,window::xcb_window_t,property::xcb_atom_t)
    ccall((:xcb_delete_property,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t),c,window,property)
end

function xcb_get_property_sizeof(_buffer)
    ccall((:xcb_get_property_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_property(c,_delete::UInt8,window::xcb_window_t,property::xcb_atom_t,_type::xcb_atom_t,long_offset::UInt32,long_length::UInt32)
    ccall((:xcb_get_property,xcb),xcb_get_property_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_atom_t,xcb_atom_t,UInt32,UInt32),c,_delete,window,property,_type,long_offset,long_length)
end

function xcb_get_property_unchecked(c,_delete::UInt8,window::xcb_window_t,property::xcb_atom_t,_type::xcb_atom_t,long_offset::UInt32,long_length::UInt32)
    ccall((:xcb_get_property_unchecked,xcb),xcb_get_property_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_atom_t,xcb_atom_t,UInt32,UInt32),c,_delete,window,property,_type,long_offset,long_length)
end

function xcb_get_property_value(R)
    ccall((:xcb_get_property_value,xcb),Ptr{Void},(Ptr{xcb_get_property_reply_t},),R)
end

function xcb_get_property_value_length(R)
    ccall((:xcb_get_property_value_length,xcb),Cint,(Ptr{xcb_get_property_reply_t},),R)
end

function xcb_get_property_value_end(R)
    ccall((:xcb_get_property_value_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_property_reply_t},),R)
end

function xcb_get_property_reply(c,cookie::xcb_get_property_cookie_t,e)
    ccall((:xcb_get_property_reply,xcb),Ptr{xcb_get_property_reply_t},(Ptr{xcb_connection_t},xcb_get_property_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_list_properties_sizeof(_buffer)
    ccall((:xcb_list_properties_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_properties(c,window::xcb_window_t)
    ccall((:xcb_list_properties,xcb),xcb_list_properties_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_list_properties_unchecked(c,window::xcb_window_t)
    ccall((:xcb_list_properties_unchecked,xcb),xcb_list_properties_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_list_properties_atoms(R)
    ccall((:xcb_list_properties_atoms,xcb),Ptr{xcb_atom_t},(Ptr{xcb_list_properties_reply_t},),R)
end

function xcb_list_properties_atoms_length(R)
    ccall((:xcb_list_properties_atoms_length,xcb),Cint,(Ptr{xcb_list_properties_reply_t},),R)
end

function xcb_list_properties_atoms_end(R)
    ccall((:xcb_list_properties_atoms_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_list_properties_reply_t},),R)
end

function xcb_list_properties_reply(c,cookie::xcb_list_properties_cookie_t,e)
    ccall((:xcb_list_properties_reply,xcb),Ptr{xcb_list_properties_reply_t},(Ptr{xcb_connection_t},xcb_list_properties_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_set_selection_owner_checked(c,owner::xcb_window_t,selection::xcb_atom_t,time::xcb_timestamp_t)
    ccall((:xcb_set_selection_owner_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t,xcb_timestamp_t),c,owner,selection,time)
end

function xcb_set_selection_owner(c,owner::xcb_window_t,selection::xcb_atom_t,time::xcb_timestamp_t)
    ccall((:xcb_set_selection_owner,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t,xcb_timestamp_t),c,owner,selection,time)
end

function xcb_get_selection_owner(c,selection::xcb_atom_t)
    ccall((:xcb_get_selection_owner,xcb),xcb_get_selection_owner_cookie_t,(Ptr{xcb_connection_t},xcb_atom_t),c,selection)
end

function xcb_get_selection_owner_unchecked(c,selection::xcb_atom_t)
    ccall((:xcb_get_selection_owner_unchecked,xcb),xcb_get_selection_owner_cookie_t,(Ptr{xcb_connection_t},xcb_atom_t),c,selection)
end

function xcb_get_selection_owner_reply(c,cookie::xcb_get_selection_owner_cookie_t,e)
    ccall((:xcb_get_selection_owner_reply,xcb),Ptr{xcb_get_selection_owner_reply_t},(Ptr{xcb_connection_t},xcb_get_selection_owner_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_convert_selection_checked(c,requestor::xcb_window_t,selection::xcb_atom_t,target::xcb_atom_t,property::xcb_atom_t,time::xcb_timestamp_t)
    ccall((:xcb_convert_selection_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t,xcb_atom_t,xcb_atom_t,xcb_timestamp_t),c,requestor,selection,target,property,time)
end

function xcb_convert_selection(c,requestor::xcb_window_t,selection::xcb_atom_t,target::xcb_atom_t,property::xcb_atom_t,time::xcb_timestamp_t)
    ccall((:xcb_convert_selection,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_atom_t,xcb_atom_t,xcb_atom_t,xcb_timestamp_t),c,requestor,selection,target,property,time)
end

function xcb_send_event_checked(c,propagate::UInt8,destination::xcb_window_t,event_mask::UInt32,event)
    ccall((:xcb_send_event_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt32,Cstring),c,propagate,destination,event_mask,event)
end

function xcb_send_event(c,propagate::UInt8,destination::xcb_window_t,event_mask::UInt32,event)
    ccall((:xcb_send_event,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt32,Cstring),c,propagate,destination,event_mask,event)
end

function xcb_grab_pointer(c,owner_events::UInt8,grab_window::xcb_window_t,event_mask::UInt16,pointer_mode::UInt8,keyboard_mode::UInt8,confine_to::xcb_window_t,cursor::xcb_cursor_t,time::xcb_timestamp_t)
    ccall((:xcb_grab_pointer,xcb),xcb_grab_pointer_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,UInt8,UInt8,xcb_window_t,xcb_cursor_t,xcb_timestamp_t),c,owner_events,grab_window,event_mask,pointer_mode,keyboard_mode,confine_to,cursor,time)
end

function xcb_grab_pointer_unchecked(c,owner_events::UInt8,grab_window::xcb_window_t,event_mask::UInt16,pointer_mode::UInt8,keyboard_mode::UInt8,confine_to::xcb_window_t,cursor::xcb_cursor_t,time::xcb_timestamp_t)
    ccall((:xcb_grab_pointer_unchecked,xcb),xcb_grab_pointer_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,UInt8,UInt8,xcb_window_t,xcb_cursor_t,xcb_timestamp_t),c,owner_events,grab_window,event_mask,pointer_mode,keyboard_mode,confine_to,cursor,time)
end

function xcb_grab_pointer_reply(c,cookie::xcb_grab_pointer_cookie_t,e)
    ccall((:xcb_grab_pointer_reply,xcb),Ptr{xcb_grab_pointer_reply_t},(Ptr{xcb_connection_t},xcb_grab_pointer_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_ungrab_pointer_checked(c,time::xcb_timestamp_t)
    ccall((:xcb_ungrab_pointer_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_timestamp_t),c,time)
end

function xcb_ungrab_pointer(c,time::xcb_timestamp_t)
    ccall((:xcb_ungrab_pointer,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_timestamp_t),c,time)
end

function xcb_grab_button_checked(c,owner_events::UInt8,grab_window::xcb_window_t,event_mask::UInt16,pointer_mode::UInt8,keyboard_mode::UInt8,confine_to::xcb_window_t,cursor::xcb_cursor_t,button::UInt8,modifiers::UInt16)
    ccall((:xcb_grab_button_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,UInt8,UInt8,xcb_window_t,xcb_cursor_t,UInt8,UInt16),c,owner_events,grab_window,event_mask,pointer_mode,keyboard_mode,confine_to,cursor,button,modifiers)
end

function xcb_grab_button(c,owner_events::UInt8,grab_window::xcb_window_t,event_mask::UInt16,pointer_mode::UInt8,keyboard_mode::UInt8,confine_to::xcb_window_t,cursor::xcb_cursor_t,button::UInt8,modifiers::UInt16)
    ccall((:xcb_grab_button,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,UInt8,UInt8,xcb_window_t,xcb_cursor_t,UInt8,UInt16),c,owner_events,grab_window,event_mask,pointer_mode,keyboard_mode,confine_to,cursor,button,modifiers)
end

function xcb_ungrab_button_checked(c,button::UInt8,grab_window::xcb_window_t,modifiers::UInt16)
    ccall((:xcb_ungrab_button_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16),c,button,grab_window,modifiers)
end

function xcb_ungrab_button(c,button::UInt8,grab_window::xcb_window_t,modifiers::UInt16)
    ccall((:xcb_ungrab_button,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16),c,button,grab_window,modifiers)
end

function xcb_change_active_pointer_grab_checked(c,cursor::xcb_cursor_t,time::xcb_timestamp_t,event_mask::UInt16)
    ccall((:xcb_change_active_pointer_grab_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_timestamp_t,UInt16),c,cursor,time,event_mask)
end

function xcb_change_active_pointer_grab(c,cursor::xcb_cursor_t,time::xcb_timestamp_t,event_mask::UInt16)
    ccall((:xcb_change_active_pointer_grab,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_timestamp_t,UInt16),c,cursor,time,event_mask)
end

function xcb_grab_keyboard(c,owner_events::UInt8,grab_window::xcb_window_t,time::xcb_timestamp_t,pointer_mode::UInt8,keyboard_mode::UInt8)
    ccall((:xcb_grab_keyboard,xcb),xcb_grab_keyboard_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_timestamp_t,UInt8,UInt8),c,owner_events,grab_window,time,pointer_mode,keyboard_mode)
end

function xcb_grab_keyboard_unchecked(c,owner_events::UInt8,grab_window::xcb_window_t,time::xcb_timestamp_t,pointer_mode::UInt8,keyboard_mode::UInt8)
    ccall((:xcb_grab_keyboard_unchecked,xcb),xcb_grab_keyboard_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_timestamp_t,UInt8,UInt8),c,owner_events,grab_window,time,pointer_mode,keyboard_mode)
end

function xcb_grab_keyboard_reply(c,cookie::xcb_grab_keyboard_cookie_t,e)
    ccall((:xcb_grab_keyboard_reply,xcb),Ptr{xcb_grab_keyboard_reply_t},(Ptr{xcb_connection_t},xcb_grab_keyboard_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_ungrab_keyboard_checked(c,time::xcb_timestamp_t)
    ccall((:xcb_ungrab_keyboard_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_timestamp_t),c,time)
end

function xcb_ungrab_keyboard(c,time::xcb_timestamp_t)
    ccall((:xcb_ungrab_keyboard,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_timestamp_t),c,time)
end

function xcb_grab_key_checked(c,owner_events::UInt8,grab_window::xcb_window_t,modifiers::UInt16,key::xcb_keycode_t,pointer_mode::UInt8,keyboard_mode::UInt8)
    ccall((:xcb_grab_key_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,xcb_keycode_t,UInt8,UInt8),c,owner_events,grab_window,modifiers,key,pointer_mode,keyboard_mode)
end

function xcb_grab_key(c,owner_events::UInt8,grab_window::xcb_window_t,modifiers::UInt16,key::xcb_keycode_t,pointer_mode::UInt8,keyboard_mode::UInt8)
    ccall((:xcb_grab_key,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,UInt16,xcb_keycode_t,UInt8,UInt8),c,owner_events,grab_window,modifiers,key,pointer_mode,keyboard_mode)
end

function xcb_ungrab_key_checked(c,key::xcb_keycode_t,grab_window::xcb_window_t,modifiers::UInt16)
    ccall((:xcb_ungrab_key_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_keycode_t,xcb_window_t,UInt16),c,key,grab_window,modifiers)
end

function xcb_ungrab_key(c,key::xcb_keycode_t,grab_window::xcb_window_t,modifiers::UInt16)
    ccall((:xcb_ungrab_key,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_keycode_t,xcb_window_t,UInt16),c,key,grab_window,modifiers)
end

function xcb_allow_events_checked(c,mode::UInt8,time::xcb_timestamp_t)
    ccall((:xcb_allow_events_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_timestamp_t),c,mode,time)
end

function xcb_allow_events(c,mode::UInt8,time::xcb_timestamp_t)
    ccall((:xcb_allow_events,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_timestamp_t),c,mode,time)
end

function xcb_grab_server_checked(c)
    ccall((:xcb_grab_server_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_grab_server(c)
    ccall((:xcb_grab_server,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_ungrab_server_checked(c)
    ccall((:xcb_ungrab_server_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_ungrab_server(c)
    ccall((:xcb_ungrab_server,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_query_pointer(c,window::xcb_window_t)
    ccall((:xcb_query_pointer,xcb),xcb_query_pointer_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_query_pointer_unchecked(c,window::xcb_window_t)
    ccall((:xcb_query_pointer_unchecked,xcb),xcb_query_pointer_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_query_pointer_reply(c,cookie::xcb_query_pointer_cookie_t,e)
    ccall((:xcb_query_pointer_reply,xcb),Ptr{xcb_query_pointer_reply_t},(Ptr{xcb_connection_t},xcb_query_pointer_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_timecoord_next(i)
    ccall((:xcb_timecoord_next,xcb),Void,(Ptr{xcb_timecoord_iterator_t},),i)
end

function xcb_timecoord_end(i::xcb_timecoord_iterator_t)
    ccall((:xcb_timecoord_end,xcb),xcb_generic_iterator_t,(xcb_timecoord_iterator_t,),i)
end

function xcb_get_motion_events_sizeof(_buffer)
    ccall((:xcb_get_motion_events_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_motion_events(c,window::xcb_window_t,start::xcb_timestamp_t,stop::xcb_timestamp_t)
    ccall((:xcb_get_motion_events,xcb),xcb_get_motion_events_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_timestamp_t,xcb_timestamp_t),c,window,start,stop)
end

function xcb_get_motion_events_unchecked(c,window::xcb_window_t,start::xcb_timestamp_t,stop::xcb_timestamp_t)
    ccall((:xcb_get_motion_events_unchecked,xcb),xcb_get_motion_events_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_timestamp_t,xcb_timestamp_t),c,window,start,stop)
end

function xcb_get_motion_events_events(R)
    ccall((:xcb_get_motion_events_events,xcb),Ptr{xcb_timecoord_t},(Ptr{xcb_get_motion_events_reply_t},),R)
end

function xcb_get_motion_events_events_length(R)
    ccall((:xcb_get_motion_events_events_length,xcb),Cint,(Ptr{xcb_get_motion_events_reply_t},),R)
end

function xcb_get_motion_events_events_iterator(R)
    ccall((:xcb_get_motion_events_events_iterator,xcb),xcb_timecoord_iterator_t,(Ptr{xcb_get_motion_events_reply_t},),R)
end

function xcb_get_motion_events_reply(c,cookie::xcb_get_motion_events_cookie_t,e)
    ccall((:xcb_get_motion_events_reply,xcb),Ptr{xcb_get_motion_events_reply_t},(Ptr{xcb_connection_t},xcb_get_motion_events_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_translate_coordinates(c,src_window::xcb_window_t,dst_window::xcb_window_t,src_x::Int16,src_y::Int16)
    ccall((:xcb_translate_coordinates,xcb),xcb_translate_coordinates_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16),c,src_window,dst_window,src_x,src_y)
end

function xcb_translate_coordinates_unchecked(c,src_window::xcb_window_t,dst_window::xcb_window_t,src_x::Int16,src_y::Int16)
    ccall((:xcb_translate_coordinates_unchecked,xcb),xcb_translate_coordinates_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16),c,src_window,dst_window,src_x,src_y)
end

function xcb_translate_coordinates_reply(c,cookie::xcb_translate_coordinates_cookie_t,e)
    ccall((:xcb_translate_coordinates_reply,xcb),Ptr{xcb_translate_coordinates_reply_t},(Ptr{xcb_connection_t},xcb_translate_coordinates_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_warp_pointer_checked(c,src_window::xcb_window_t,dst_window::xcb_window_t,src_x::Int16,src_y::Int16,src_width::UInt16,src_height::UInt16,dst_x::Int16,dst_y::Int16)
    ccall((:xcb_warp_pointer_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16,UInt16,UInt16,Int16,Int16),c,src_window,dst_window,src_x,src_y,src_width,src_height,dst_x,dst_y)
end

function xcb_warp_pointer(c,src_window::xcb_window_t,dst_window::xcb_window_t,src_x::Int16,src_y::Int16,src_width::UInt16,src_height::UInt16,dst_x::Int16,dst_y::Int16)
    ccall((:xcb_warp_pointer,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,xcb_window_t,Int16,Int16,UInt16,UInt16,Int16,Int16),c,src_window,dst_window,src_x,src_y,src_width,src_height,dst_x,dst_y)
end

function xcb_set_input_focus_checked(c,revert_to::UInt8,focus::xcb_window_t,time::xcb_timestamp_t)
    ccall((:xcb_set_input_focus_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_timestamp_t),c,revert_to,focus,time)
end

function xcb_set_input_focus(c,revert_to::UInt8,focus::xcb_window_t,time::xcb_timestamp_t)
    ccall((:xcb_set_input_focus,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,xcb_timestamp_t),c,revert_to,focus,time)
end

function xcb_get_input_focus(c)
    ccall((:xcb_get_input_focus,xcb),xcb_get_input_focus_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_input_focus_unchecked(c)
    ccall((:xcb_get_input_focus_unchecked,xcb),xcb_get_input_focus_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_input_focus_reply(c,cookie::xcb_get_input_focus_cookie_t,e)
    ccall((:xcb_get_input_focus_reply,xcb),Ptr{xcb_get_input_focus_reply_t},(Ptr{xcb_connection_t},xcb_get_input_focus_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_query_keymap(c)
    ccall((:xcb_query_keymap,xcb),xcb_query_keymap_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_query_keymap_unchecked(c)
    ccall((:xcb_query_keymap_unchecked,xcb),xcb_query_keymap_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_query_keymap_reply(c,cookie::xcb_query_keymap_cookie_t,e)
    ccall((:xcb_query_keymap_reply,xcb),Ptr{xcb_query_keymap_reply_t},(Ptr{xcb_connection_t},xcb_query_keymap_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_open_font_sizeof(_buffer)
    ccall((:xcb_open_font_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_open_font_checked(c,fid::xcb_font_t,name_len::UInt16,name)
    ccall((:xcb_open_font_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_font_t,UInt16,Cstring),c,fid,name_len,name)
end

function xcb_open_font(c,fid::xcb_font_t,name_len::UInt16,name)
    ccall((:xcb_open_font,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_font_t,UInt16,Cstring),c,fid,name_len,name)
end

function xcb_close_font_checked(c,font::xcb_font_t)
    ccall((:xcb_close_font_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_font_t),c,font)
end

function xcb_close_font(c,font::xcb_font_t)
    ccall((:xcb_close_font,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_font_t),c,font)
end

function xcb_fontprop_next(i)
    ccall((:xcb_fontprop_next,xcb),Void,(Ptr{xcb_fontprop_iterator_t},),i)
end

function xcb_fontprop_end(i::xcb_fontprop_iterator_t)
    ccall((:xcb_fontprop_end,xcb),xcb_generic_iterator_t,(xcb_fontprop_iterator_t,),i)
end

function xcb_charinfo_next(i)
    ccall((:xcb_charinfo_next,xcb),Void,(Ptr{xcb_charinfo_iterator_t},),i)
end

function xcb_charinfo_end(i::xcb_charinfo_iterator_t)
    ccall((:xcb_charinfo_end,xcb),xcb_generic_iterator_t,(xcb_charinfo_iterator_t,),i)
end

function xcb_query_font_sizeof(_buffer)
    ccall((:xcb_query_font_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_query_font(c,font::xcb_fontable_t)
    ccall((:xcb_query_font,xcb),xcb_query_font_cookie_t,(Ptr{xcb_connection_t},xcb_fontable_t),c,font)
end

function xcb_query_font_unchecked(c,font::xcb_fontable_t)
    ccall((:xcb_query_font_unchecked,xcb),xcb_query_font_cookie_t,(Ptr{xcb_connection_t},xcb_fontable_t),c,font)
end

function xcb_query_font_properties(R)
    ccall((:xcb_query_font_properties,xcb),Ptr{xcb_fontprop_t},(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_properties_length(R)
    ccall((:xcb_query_font_properties_length,xcb),Cint,(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_properties_iterator(R)
    ccall((:xcb_query_font_properties_iterator,xcb),xcb_fontprop_iterator_t,(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_char_infos(R)
    ccall((:xcb_query_font_char_infos,xcb),Ptr{xcb_charinfo_t},(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_char_infos_length(R)
    ccall((:xcb_query_font_char_infos_length,xcb),Cint,(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_char_infos_iterator(R)
    ccall((:xcb_query_font_char_infos_iterator,xcb),xcb_charinfo_iterator_t,(Ptr{xcb_query_font_reply_t},),R)
end

function xcb_query_font_reply(c,cookie::xcb_query_font_cookie_t,e)
    ccall((:xcb_query_font_reply,xcb),Ptr{xcb_query_font_reply_t},(Ptr{xcb_connection_t},xcb_query_font_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_query_text_extents_sizeof(_buffer,string_len::UInt32)
    ccall((:xcb_query_text_extents_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,string_len)
end

function xcb_query_text_extents(c,font::xcb_fontable_t,string_len::UInt32,string)
    ccall((:xcb_query_text_extents,xcb),xcb_query_text_extents_cookie_t,(Ptr{xcb_connection_t},xcb_fontable_t,UInt32,Ptr{xcb_char2b_t}),c,font,string_len,string)
end

function xcb_query_text_extents_unchecked(c,font::xcb_fontable_t,string_len::UInt32,string)
    ccall((:xcb_query_text_extents_unchecked,xcb),xcb_query_text_extents_cookie_t,(Ptr{xcb_connection_t},xcb_fontable_t,UInt32,Ptr{xcb_char2b_t}),c,font,string_len,string)
end

function xcb_query_text_extents_reply(c,cookie::xcb_query_text_extents_cookie_t,e)
    ccall((:xcb_query_text_extents_reply,xcb),Ptr{xcb_query_text_extents_reply_t},(Ptr{xcb_connection_t},xcb_query_text_extents_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_str_sizeof(_buffer)
    ccall((:xcb_str_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_str_name(R)
    ccall((:xcb_str_name,xcb),Cstring,(Ptr{xcb_str_t},),R)
end

function xcb_str_name_length(R)
    ccall((:xcb_str_name_length,xcb),Cint,(Ptr{xcb_str_t},),R)
end

function xcb_str_name_end(R)
    ccall((:xcb_str_name_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_str_t},),R)
end

function xcb_str_next(i)
    ccall((:xcb_str_next,xcb),Void,(Ptr{xcb_str_iterator_t},),i)
end

function xcb_str_end(i::xcb_str_iterator_t)
    ccall((:xcb_str_end,xcb),xcb_generic_iterator_t,(xcb_str_iterator_t,),i)
end

function xcb_list_fonts_sizeof(_buffer)
    ccall((:xcb_list_fonts_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_fonts(c,max_names::UInt16,pattern_len::UInt16,pattern)
    ccall((:xcb_list_fonts,xcb),xcb_list_fonts_cookie_t,(Ptr{xcb_connection_t},UInt16,UInt16,Cstring),c,max_names,pattern_len,pattern)
end

function xcb_list_fonts_unchecked(c,max_names::UInt16,pattern_len::UInt16,pattern)
    ccall((:xcb_list_fonts_unchecked,xcb),xcb_list_fonts_cookie_t,(Ptr{xcb_connection_t},UInt16,UInt16,Cstring),c,max_names,pattern_len,pattern)
end

function xcb_list_fonts_names_length(R)
    ccall((:xcb_list_fonts_names_length,xcb),Cint,(Ptr{xcb_list_fonts_reply_t},),R)
end

function xcb_list_fonts_names_iterator(R)
    ccall((:xcb_list_fonts_names_iterator,xcb),xcb_str_iterator_t,(Ptr{xcb_list_fonts_reply_t},),R)
end

function xcb_list_fonts_reply(c,cookie::xcb_list_fonts_cookie_t,e)
    ccall((:xcb_list_fonts_reply,xcb),Ptr{xcb_list_fonts_reply_t},(Ptr{xcb_connection_t},xcb_list_fonts_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_list_fonts_with_info_sizeof(_buffer)
    ccall((:xcb_list_fonts_with_info_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_fonts_with_info(c,max_names::UInt16,pattern_len::UInt16,pattern)
    ccall((:xcb_list_fonts_with_info,xcb),xcb_list_fonts_with_info_cookie_t,(Ptr{xcb_connection_t},UInt16,UInt16,Cstring),c,max_names,pattern_len,pattern)
end

function xcb_list_fonts_with_info_unchecked(c,max_names::UInt16,pattern_len::UInt16,pattern)
    ccall((:xcb_list_fonts_with_info_unchecked,xcb),xcb_list_fonts_with_info_cookie_t,(Ptr{xcb_connection_t},UInt16,UInt16,Cstring),c,max_names,pattern_len,pattern)
end

function xcb_list_fonts_with_info_properties(R)
    ccall((:xcb_list_fonts_with_info_properties,xcb),Ptr{xcb_fontprop_t},(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_properties_length(R)
    ccall((:xcb_list_fonts_with_info_properties_length,xcb),Cint,(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_properties_iterator(R)
    ccall((:xcb_list_fonts_with_info_properties_iterator,xcb),xcb_fontprop_iterator_t,(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_name(R)
    ccall((:xcb_list_fonts_with_info_name,xcb),Cstring,(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_name_length(R)
    ccall((:xcb_list_fonts_with_info_name_length,xcb),Cint,(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_name_end(R)
    ccall((:xcb_list_fonts_with_info_name_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_list_fonts_with_info_reply_t},),R)
end

function xcb_list_fonts_with_info_reply(c,cookie::xcb_list_fonts_with_info_cookie_t,e)
    ccall((:xcb_list_fonts_with_info_reply,xcb),Ptr{xcb_list_fonts_with_info_reply_t},(Ptr{xcb_connection_t},xcb_list_fonts_with_info_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_set_font_path_sizeof(_buffer)
    ccall((:xcb_set_font_path_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_set_font_path_checked(c,font_qty::UInt16,font)
    ccall((:xcb_set_font_path_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt16,Ptr{xcb_str_t}),c,font_qty,font)
end

function xcb_set_font_path(c,font_qty::UInt16,font)
    ccall((:xcb_set_font_path,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt16,Ptr{xcb_str_t}),c,font_qty,font)
end

function xcb_get_font_path_sizeof(_buffer)
    ccall((:xcb_get_font_path_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_font_path(c)
    ccall((:xcb_get_font_path,xcb),xcb_get_font_path_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_font_path_unchecked(c)
    ccall((:xcb_get_font_path_unchecked,xcb),xcb_get_font_path_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_font_path_path_length(R)
    ccall((:xcb_get_font_path_path_length,xcb),Cint,(Ptr{xcb_get_font_path_reply_t},),R)
end

function xcb_get_font_path_path_iterator(R)
    ccall((:xcb_get_font_path_path_iterator,xcb),xcb_str_iterator_t,(Ptr{xcb_get_font_path_reply_t},),R)
end

function xcb_get_font_path_reply(c,cookie::xcb_get_font_path_cookie_t,e)
    ccall((:xcb_get_font_path_reply,xcb),Ptr{xcb_get_font_path_reply_t},(Ptr{xcb_connection_t},xcb_get_font_path_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_create_pixmap_checked(c,depth::UInt8,pid::xcb_pixmap_t,drawable::xcb_drawable_t,width::UInt16,height::UInt16)
    ccall((:xcb_create_pixmap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_pixmap_t,xcb_drawable_t,UInt16,UInt16),c,depth,pid,drawable,width,height)
end

function xcb_create_pixmap(c,depth::UInt8,pid::xcb_pixmap_t,drawable::xcb_drawable_t,width::UInt16,height::UInt16)
    ccall((:xcb_create_pixmap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_pixmap_t,xcb_drawable_t,UInt16,UInt16),c,depth,pid,drawable,width,height)
end

function xcb_free_pixmap_checked(c,pixmap::xcb_pixmap_t)
    ccall((:xcb_free_pixmap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_pixmap_t),c,pixmap)
end

function xcb_free_pixmap(c,pixmap::xcb_pixmap_t)
    ccall((:xcb_free_pixmap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_pixmap_t),c,pixmap)
end

function xcb_create_gc_sizeof(_buffer)
    ccall((:xcb_create_gc_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_create_gc_checked(c,cid::xcb_gcontext_t,drawable::xcb_drawable_t,value_mask::UInt32,value_list)
    ccall((:xcb_create_gc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,xcb_drawable_t,UInt32,Ptr{UInt32}),c,cid,drawable,value_mask,value_list)
end

function xcb_create_gc(c,cid::xcb_gcontext_t,drawable::xcb_drawable_t,value_mask::UInt32,value_list)
    ccall((:xcb_create_gc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,xcb_drawable_t,UInt32,Ptr{UInt32}),c,cid,drawable,value_mask,value_list)
end

function xcb_change_gc_sizeof(_buffer)
    ccall((:xcb_change_gc_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_gc_checked(c,gc::xcb_gcontext_t,value_mask::UInt32,value_list)
    ccall((:xcb_change_gc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,UInt32,Ptr{UInt32}),c,gc,value_mask,value_list)
end

function xcb_change_gc(c,gc::xcb_gcontext_t,value_mask::UInt32,value_list)
    ccall((:xcb_change_gc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,UInt32,Ptr{UInt32}),c,gc,value_mask,value_list)
end

function xcb_copy_gc_checked(c,src_gc::xcb_gcontext_t,dst_gc::xcb_gcontext_t,value_mask::UInt32)
    ccall((:xcb_copy_gc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,xcb_gcontext_t,UInt32),c,src_gc,dst_gc,value_mask)
end

function xcb_copy_gc(c,src_gc::xcb_gcontext_t,dst_gc::xcb_gcontext_t,value_mask::UInt32)
    ccall((:xcb_copy_gc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,xcb_gcontext_t,UInt32),c,src_gc,dst_gc,value_mask)
end

function xcb_set_dashes_sizeof(_buffer)
    ccall((:xcb_set_dashes_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_set_dashes_checked(c,gc::xcb_gcontext_t,dash_offset::UInt16,dashes_len::UInt16,dashes)
    ccall((:xcb_set_dashes_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,UInt16,UInt16,Ptr{UInt8}),c,gc,dash_offset,dashes_len,dashes)
end

function xcb_set_dashes(c,gc::xcb_gcontext_t,dash_offset::UInt16,dashes_len::UInt16,dashes)
    ccall((:xcb_set_dashes,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t,UInt16,UInt16,Ptr{UInt8}),c,gc,dash_offset,dashes_len,dashes)
end

function xcb_set_clip_rectangles_sizeof(_buffer,rectangles_len::UInt32)
    ccall((:xcb_set_clip_rectangles_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,rectangles_len)
end

function xcb_set_clip_rectangles_checked(c,ordering::UInt8,gc::xcb_gcontext_t,clip_x_origin::Int16,clip_y_origin::Int16,rectangles_len::UInt32,rectangles)
    ccall((:xcb_set_clip_rectangles_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{xcb_rectangle_t}),c,ordering,gc,clip_x_origin,clip_y_origin,rectangles_len,rectangles)
end

function xcb_set_clip_rectangles(c,ordering::UInt8,gc::xcb_gcontext_t,clip_x_origin::Int16,clip_y_origin::Int16,rectangles_len::UInt32,rectangles)
    ccall((:xcb_set_clip_rectangles,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{xcb_rectangle_t}),c,ordering,gc,clip_x_origin,clip_y_origin,rectangles_len,rectangles)
end

function xcb_free_gc_checked(c,gc::xcb_gcontext_t)
    ccall((:xcb_free_gc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t),c,gc)
end

function xcb_free_gc(c,gc::xcb_gcontext_t)
    ccall((:xcb_free_gc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_gcontext_t),c,gc)
end

function xcb_clear_area_checked(c,exposures::UInt8,window::xcb_window_t,x::Int16,y::Int16,width::UInt16,height::UInt16)
    ccall((:xcb_clear_area_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,Int16,Int16,UInt16,UInt16),c,exposures,window,x,y,width,height)
end

function xcb_clear_area(c,exposures::UInt8,window::xcb_window_t,x::Int16,y::Int16,width::UInt16,height::UInt16)
    ccall((:xcb_clear_area,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_window_t,Int16,Int16,UInt16,UInt16),c,exposures,window,x,y,width,height)
end

function xcb_copy_area_checked(c,src_drawable::xcb_drawable_t,dst_drawable::xcb_drawable_t,gc::xcb_gcontext_t,src_x::Int16,src_y::Int16,dst_x::Int16,dst_y::Int16,width::UInt16,height::UInt16)
    ccall((:xcb_copy_area_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Int16,Int16,UInt16,UInt16),c,src_drawable,dst_drawable,gc,src_x,src_y,dst_x,dst_y,width,height)
end

function xcb_copy_area(c,src_drawable::xcb_drawable_t,dst_drawable::xcb_drawable_t,gc::xcb_gcontext_t,src_x::Int16,src_y::Int16,dst_x::Int16,dst_y::Int16,width::UInt16,height::UInt16)
    ccall((:xcb_copy_area,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Int16,Int16,UInt16,UInt16),c,src_drawable,dst_drawable,gc,src_x,src_y,dst_x,dst_y,width,height)
end

function xcb_copy_plane_checked(c,src_drawable::xcb_drawable_t,dst_drawable::xcb_drawable_t,gc::xcb_gcontext_t,src_x::Int16,src_y::Int16,dst_x::Int16,dst_y::Int16,width::UInt16,height::UInt16,bit_plane::UInt32)
    ccall((:xcb_copy_plane_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Int16,Int16,UInt16,UInt16,UInt32),c,src_drawable,dst_drawable,gc,src_x,src_y,dst_x,dst_y,width,height,bit_plane)
end

function xcb_copy_plane(c,src_drawable::xcb_drawable_t,dst_drawable::xcb_drawable_t,gc::xcb_gcontext_t,src_x::Int16,src_y::Int16,dst_x::Int16,dst_y::Int16,width::UInt16,height::UInt16,bit_plane::UInt32)
    ccall((:xcb_copy_plane,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Int16,Int16,UInt16,UInt16,UInt32),c,src_drawable,dst_drawable,gc,src_x,src_y,dst_x,dst_y,width,height,bit_plane)
end

function xcb_poly_point_sizeof(_buffer,points_len::UInt32)
    ccall((:xcb_poly_point_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,points_len)
end

function xcb_poly_point_checked(c,coordinate_mode::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,points_len::UInt32,points)
    ccall((:xcb_poly_point_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_point_t}),c,coordinate_mode,drawable,gc,points_len,points)
end

function xcb_poly_point(c,coordinate_mode::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,points_len::UInt32,points)
    ccall((:xcb_poly_point,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_point_t}),c,coordinate_mode,drawable,gc,points_len,points)
end

function xcb_poly_line_sizeof(_buffer,points_len::UInt32)
    ccall((:xcb_poly_line_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,points_len)
end

function xcb_poly_line_checked(c,coordinate_mode::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,points_len::UInt32,points)
    ccall((:xcb_poly_line_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_point_t}),c,coordinate_mode,drawable,gc,points_len,points)
end

function xcb_poly_line(c,coordinate_mode::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,points_len::UInt32,points)
    ccall((:xcb_poly_line,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_point_t}),c,coordinate_mode,drawable,gc,points_len,points)
end

function xcb_segment_next(i)
    ccall((:xcb_segment_next,xcb),Void,(Ptr{xcb_segment_iterator_t},),i)
end

function xcb_segment_end(i::xcb_segment_iterator_t)
    ccall((:xcb_segment_end,xcb),xcb_generic_iterator_t,(xcb_segment_iterator_t,),i)
end

function xcb_poly_segment_sizeof(_buffer,segments_len::UInt32)
    ccall((:xcb_poly_segment_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,segments_len)
end

function xcb_poly_segment_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,segments_len::UInt32,segments)
    ccall((:xcb_poly_segment_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_segment_t}),c,drawable,gc,segments_len,segments)
end

function xcb_poly_segment(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,segments_len::UInt32,segments)
    ccall((:xcb_poly_segment,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_segment_t}),c,drawable,gc,segments_len,segments)
end

function xcb_poly_rectangle_sizeof(_buffer,rectangles_len::UInt32)
    ccall((:xcb_poly_rectangle_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,rectangles_len)
end

function xcb_poly_rectangle_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,rectangles_len::UInt32,rectangles)
    ccall((:xcb_poly_rectangle_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_rectangle_t}),c,drawable,gc,rectangles_len,rectangles)
end

function xcb_poly_rectangle(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,rectangles_len::UInt32,rectangles)
    ccall((:xcb_poly_rectangle,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_rectangle_t}),c,drawable,gc,rectangles_len,rectangles)
end

function xcb_poly_arc_sizeof(_buffer,arcs_len::UInt32)
    ccall((:xcb_poly_arc_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,arcs_len)
end

function xcb_poly_arc_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,arcs_len::UInt32,arcs)
    ccall((:xcb_poly_arc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_arc_t}),c,drawable,gc,arcs_len,arcs)
end

function xcb_poly_arc(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,arcs_len::UInt32,arcs)
    ccall((:xcb_poly_arc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_arc_t}),c,drawable,gc,arcs_len,arcs)
end

function xcb_fill_poly_sizeof(_buffer,points_len::UInt32)
    ccall((:xcb_fill_poly_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,points_len)
end

function xcb_fill_poly_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,shape::UInt8,coordinate_mode::UInt8,points_len::UInt32,points)
    ccall((:xcb_fill_poly_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt8,UInt8,UInt32,Ptr{xcb_point_t}),c,drawable,gc,shape,coordinate_mode,points_len,points)
end

function xcb_fill_poly(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,shape::UInt8,coordinate_mode::UInt8,points_len::UInt32,points)
    ccall((:xcb_fill_poly,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt8,UInt8,UInt32,Ptr{xcb_point_t}),c,drawable,gc,shape,coordinate_mode,points_len,points)
end

function xcb_poly_fill_rectangle_sizeof(_buffer,rectangles_len::UInt32)
    ccall((:xcb_poly_fill_rectangle_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,rectangles_len)
end

function xcb_poly_fill_rectangle_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,rectangles_len::UInt32,rectangles)
    ccall((:xcb_poly_fill_rectangle_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_rectangle_t}),c,drawable,gc,rectangles_len,rectangles)
end

function xcb_poly_fill_rectangle(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,rectangles_len::UInt32,rectangles)
    ccall((:xcb_poly_fill_rectangle,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_rectangle_t}),c,drawable,gc,rectangles_len,rectangles)
end

function xcb_poly_fill_arc_sizeof(_buffer,arcs_len::UInt32)
    ccall((:xcb_poly_fill_arc_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,arcs_len)
end

function xcb_poly_fill_arc_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,arcs_len::UInt32,arcs)
    ccall((:xcb_poly_fill_arc_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_arc_t}),c,drawable,gc,arcs_len,arcs)
end

function xcb_poly_fill_arc(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,arcs_len::UInt32,arcs)
    ccall((:xcb_poly_fill_arc,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,UInt32,Ptr{xcb_arc_t}),c,drawable,gc,arcs_len,arcs)
end

function xcb_put_image_sizeof(_buffer,data_len::UInt32)
    ccall((:xcb_put_image_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,data_len)
end

function xcb_put_image_checked(c,format::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,width::UInt16,height::UInt16,dst_x::Int16,dst_y::Int16,left_pad::UInt8,depth::UInt8,data_len::UInt32,data)
    ccall((:xcb_put_image_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt16,UInt16,Int16,Int16,UInt8,UInt8,UInt32,Ptr{UInt8}),c,format,drawable,gc,width,height,dst_x,dst_y,left_pad,depth,data_len,data)
end

function xcb_put_image(c,format::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,width::UInt16,height::UInt16,dst_x::Int16,dst_y::Int16,left_pad::UInt8,depth::UInt8,data_len::UInt32,data)
    ccall((:xcb_put_image,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,UInt16,UInt16,Int16,Int16,UInt8,UInt8,UInt32,Ptr{UInt8}),c,format,drawable,gc,width,height,dst_x,dst_y,left_pad,depth,data_len,data)
end

function xcb_get_image_sizeof(_buffer)
    ccall((:xcb_get_image_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_image(c,format::UInt8,drawable::xcb_drawable_t,x::Int16,y::Int16,width::UInt16,height::UInt16,plane_mask::UInt32)
    ccall((:xcb_get_image,xcb),xcb_get_image_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,Int16,Int16,UInt16,UInt16,UInt32),c,format,drawable,x,y,width,height,plane_mask)
end

function xcb_get_image_unchecked(c,format::UInt8,drawable::xcb_drawable_t,x::Int16,y::Int16,width::UInt16,height::UInt16,plane_mask::UInt32)
    ccall((:xcb_get_image_unchecked,xcb),xcb_get_image_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,Int16,Int16,UInt16,UInt16,UInt32),c,format,drawable,x,y,width,height,plane_mask)
end

function xcb_get_image_data(R)
    ccall((:xcb_get_image_data,xcb),Ptr{UInt8},(Ptr{xcb_get_image_reply_t},),R)
end

function xcb_get_image_data_length(R)
    ccall((:xcb_get_image_data_length,xcb),Cint,(Ptr{xcb_get_image_reply_t},),R)
end

function xcb_get_image_data_end(R)
    ccall((:xcb_get_image_data_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_image_reply_t},),R)
end

function xcb_get_image_reply(c,cookie::xcb_get_image_cookie_t,e)
    ccall((:xcb_get_image_reply,xcb),Ptr{xcb_get_image_reply_t},(Ptr{xcb_connection_t},xcb_get_image_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_poly_text_8_sizeof(_buffer,items_len::UInt32)
    ccall((:xcb_poly_text_8_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,items_len)
end

function xcb_poly_text_8_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,items_len::UInt32,items)
    ccall((:xcb_poly_text_8_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{UInt8}),c,drawable,gc,x,y,items_len,items)
end

function xcb_poly_text_8(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,items_len::UInt32,items)
    ccall((:xcb_poly_text_8,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{UInt8}),c,drawable,gc,x,y,items_len,items)
end

function xcb_poly_text_16_sizeof(_buffer,items_len::UInt32)
    ccall((:xcb_poly_text_16_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,items_len)
end

function xcb_poly_text_16_checked(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,items_len::UInt32,items)
    ccall((:xcb_poly_text_16_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{UInt8}),c,drawable,gc,x,y,items_len,items)
end

function xcb_poly_text_16(c,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,items_len::UInt32,items)
    ccall((:xcb_poly_text_16,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_drawable_t,xcb_gcontext_t,Int16,Int16,UInt32,Ptr{UInt8}),c,drawable,gc,x,y,items_len,items)
end

function xcb_image_text_8_sizeof(_buffer)
    ccall((:xcb_image_text_8_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_image_text_8_checked(c,string_len::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,string)
    ccall((:xcb_image_text_8_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Cstring),c,string_len,drawable,gc,x,y,string)
end

function xcb_image_text_8(c,string_len::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,string)
    ccall((:xcb_image_text_8,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Cstring),c,string_len,drawable,gc,x,y,string)
end

function xcb_image_text_16_sizeof(_buffer)
    ccall((:xcb_image_text_16_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_image_text_16_checked(c,string_len::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,string)
    ccall((:xcb_image_text_16_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Ptr{xcb_char2b_t}),c,string_len,drawable,gc,x,y,string)
end

function xcb_image_text_16(c,string_len::UInt8,drawable::xcb_drawable_t,gc::xcb_gcontext_t,x::Int16,y::Int16,string)
    ccall((:xcb_image_text_16,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,xcb_gcontext_t,Int16,Int16,Ptr{xcb_char2b_t}),c,string_len,drawable,gc,x,y,string)
end

function xcb_create_colormap_checked(c,alloc::UInt8,mid::xcb_colormap_t,window::xcb_window_t,visual::xcb_visualid_t)
    ccall((:xcb_create_colormap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,xcb_window_t,xcb_visualid_t),c,alloc,mid,window,visual)
end

function xcb_create_colormap(c,alloc::UInt8,mid::xcb_colormap_t,window::xcb_window_t,visual::xcb_visualid_t)
    ccall((:xcb_create_colormap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,xcb_window_t,xcb_visualid_t),c,alloc,mid,window,visual)
end

function xcb_free_colormap_checked(c,cmap::xcb_colormap_t)
    ccall((:xcb_free_colormap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_free_colormap(c,cmap::xcb_colormap_t)
    ccall((:xcb_free_colormap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_copy_colormap_and_free_checked(c,mid::xcb_colormap_t,src_cmap::xcb_colormap_t)
    ccall((:xcb_copy_colormap_and_free_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,xcb_colormap_t),c,mid,src_cmap)
end

function xcb_copy_colormap_and_free(c,mid::xcb_colormap_t,src_cmap::xcb_colormap_t)
    ccall((:xcb_copy_colormap_and_free,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,xcb_colormap_t),c,mid,src_cmap)
end

function xcb_install_colormap_checked(c,cmap::xcb_colormap_t)
    ccall((:xcb_install_colormap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_install_colormap(c,cmap::xcb_colormap_t)
    ccall((:xcb_install_colormap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_uninstall_colormap_checked(c,cmap::xcb_colormap_t)
    ccall((:xcb_uninstall_colormap_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_uninstall_colormap(c,cmap::xcb_colormap_t)
    ccall((:xcb_uninstall_colormap,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t),c,cmap)
end

function xcb_list_installed_colormaps_sizeof(_buffer)
    ccall((:xcb_list_installed_colormaps_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_installed_colormaps(c,window::xcb_window_t)
    ccall((:xcb_list_installed_colormaps,xcb),xcb_list_installed_colormaps_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_list_installed_colormaps_unchecked(c,window::xcb_window_t)
    ccall((:xcb_list_installed_colormaps_unchecked,xcb),xcb_list_installed_colormaps_cookie_t,(Ptr{xcb_connection_t},xcb_window_t),c,window)
end

function xcb_list_installed_colormaps_cmaps(R)
    ccall((:xcb_list_installed_colormaps_cmaps,xcb),Ptr{xcb_colormap_t},(Ptr{xcb_list_installed_colormaps_reply_t},),R)
end

function xcb_list_installed_colormaps_cmaps_length(R)
    ccall((:xcb_list_installed_colormaps_cmaps_length,xcb),Cint,(Ptr{xcb_list_installed_colormaps_reply_t},),R)
end

function xcb_list_installed_colormaps_cmaps_end(R)
    ccall((:xcb_list_installed_colormaps_cmaps_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_list_installed_colormaps_reply_t},),R)
end

function xcb_list_installed_colormaps_reply(c,cookie::xcb_list_installed_colormaps_cookie_t,e)
    ccall((:xcb_list_installed_colormaps_reply,xcb),Ptr{xcb_list_installed_colormaps_reply_t},(Ptr{xcb_connection_t},xcb_list_installed_colormaps_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_alloc_color(c,cmap::xcb_colormap_t,red::UInt16,green::UInt16,blue::UInt16)
    ccall((:xcb_alloc_color,xcb),xcb_alloc_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,UInt16,UInt16),c,cmap,red,green,blue)
end

function xcb_alloc_color_unchecked(c,cmap::xcb_colormap_t,red::UInt16,green::UInt16,blue::UInt16)
    ccall((:xcb_alloc_color_unchecked,xcb),xcb_alloc_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,UInt16,UInt16),c,cmap,red,green,blue)
end

function xcb_alloc_color_reply(c,cookie::xcb_alloc_color_cookie_t,e)
    ccall((:xcb_alloc_color_reply,xcb),Ptr{xcb_alloc_color_reply_t},(Ptr{xcb_connection_t},xcb_alloc_color_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_alloc_named_color_sizeof(_buffer)
    ccall((:xcb_alloc_named_color_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_alloc_named_color(c,cmap::xcb_colormap_t,name_len::UInt16,name)
    ccall((:xcb_alloc_named_color,xcb),xcb_alloc_named_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,Cstring),c,cmap,name_len,name)
end

function xcb_alloc_named_color_unchecked(c,cmap::xcb_colormap_t,name_len::UInt16,name)
    ccall((:xcb_alloc_named_color_unchecked,xcb),xcb_alloc_named_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,Cstring),c,cmap,name_len,name)
end

function xcb_alloc_named_color_reply(c,cookie::xcb_alloc_named_color_cookie_t,e)
    ccall((:xcb_alloc_named_color_reply,xcb),Ptr{xcb_alloc_named_color_reply_t},(Ptr{xcb_connection_t},xcb_alloc_named_color_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_alloc_color_cells_sizeof(_buffer)
    ccall((:xcb_alloc_color_cells_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_alloc_color_cells(c,contiguous::UInt8,cmap::xcb_colormap_t,colors::UInt16,planes::UInt16)
    ccall((:xcb_alloc_color_cells,xcb),xcb_alloc_color_cells_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt16,UInt16),c,contiguous,cmap,colors,planes)
end

function xcb_alloc_color_cells_unchecked(c,contiguous::UInt8,cmap::xcb_colormap_t,colors::UInt16,planes::UInt16)
    ccall((:xcb_alloc_color_cells_unchecked,xcb),xcb_alloc_color_cells_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt16,UInt16),c,contiguous,cmap,colors,planes)
end

function xcb_alloc_color_cells_pixels(R)
    ccall((:xcb_alloc_color_cells_pixels,xcb),Ptr{UInt32},(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_pixels_length(R)
    ccall((:xcb_alloc_color_cells_pixels_length,xcb),Cint,(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_pixels_end(R)
    ccall((:xcb_alloc_color_cells_pixels_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_masks(R)
    ccall((:xcb_alloc_color_cells_masks,xcb),Ptr{UInt32},(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_masks_length(R)
    ccall((:xcb_alloc_color_cells_masks_length,xcb),Cint,(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_masks_end(R)
    ccall((:xcb_alloc_color_cells_masks_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_alloc_color_cells_reply_t},),R)
end

function xcb_alloc_color_cells_reply(c,cookie::xcb_alloc_color_cells_cookie_t,e)
    ccall((:xcb_alloc_color_cells_reply,xcb),Ptr{xcb_alloc_color_cells_reply_t},(Ptr{xcb_connection_t},xcb_alloc_color_cells_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_alloc_color_planes_sizeof(_buffer)
    ccall((:xcb_alloc_color_planes_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_alloc_color_planes(c,contiguous::UInt8,cmap::xcb_colormap_t,colors::UInt16,reds::UInt16,greens::UInt16,blues::UInt16)
    ccall((:xcb_alloc_color_planes,xcb),xcb_alloc_color_planes_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt16,UInt16,UInt16,UInt16),c,contiguous,cmap,colors,reds,greens,blues)
end

function xcb_alloc_color_planes_unchecked(c,contiguous::UInt8,cmap::xcb_colormap_t,colors::UInt16,reds::UInt16,greens::UInt16,blues::UInt16)
    ccall((:xcb_alloc_color_planes_unchecked,xcb),xcb_alloc_color_planes_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt16,UInt16,UInt16,UInt16),c,contiguous,cmap,colors,reds,greens,blues)
end

function xcb_alloc_color_planes_pixels(R)
    ccall((:xcb_alloc_color_planes_pixels,xcb),Ptr{UInt32},(Ptr{xcb_alloc_color_planes_reply_t},),R)
end

function xcb_alloc_color_planes_pixels_length(R)
    ccall((:xcb_alloc_color_planes_pixels_length,xcb),Cint,(Ptr{xcb_alloc_color_planes_reply_t},),R)
end

function xcb_alloc_color_planes_pixels_end(R)
    ccall((:xcb_alloc_color_planes_pixels_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_alloc_color_planes_reply_t},),R)
end

function xcb_alloc_color_planes_reply(c,cookie::xcb_alloc_color_planes_cookie_t,e)
    ccall((:xcb_alloc_color_planes_reply,xcb),Ptr{xcb_alloc_color_planes_reply_t},(Ptr{xcb_connection_t},xcb_alloc_color_planes_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_free_colors_sizeof(_buffer,pixels_len::UInt32)
    ccall((:xcb_free_colors_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,pixels_len)
end

function xcb_free_colors_checked(c,cmap::xcb_colormap_t,plane_mask::UInt32,pixels_len::UInt32,pixels)
    ccall((:xcb_free_colors_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,UInt32,Ptr{UInt32}),c,cmap,plane_mask,pixels_len,pixels)
end

function xcb_free_colors(c,cmap::xcb_colormap_t,plane_mask::UInt32,pixels_len::UInt32,pixels)
    ccall((:xcb_free_colors,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,UInt32,Ptr{UInt32}),c,cmap,plane_mask,pixels_len,pixels)
end

function xcb_coloritem_next(i)
    ccall((:xcb_coloritem_next,xcb),Void,(Ptr{xcb_coloritem_iterator_t},),i)
end

function xcb_coloritem_end(i::xcb_coloritem_iterator_t)
    ccall((:xcb_coloritem_end,xcb),xcb_generic_iterator_t,(xcb_coloritem_iterator_t,),i)
end

function xcb_store_colors_sizeof(_buffer,items_len::UInt32)
    ccall((:xcb_store_colors_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,items_len)
end

function xcb_store_colors_checked(c,cmap::xcb_colormap_t,items_len::UInt32,items)
    ccall((:xcb_store_colors_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,Ptr{xcb_coloritem_t}),c,cmap,items_len,items)
end

function xcb_store_colors(c,cmap::xcb_colormap_t,items_len::UInt32,items)
    ccall((:xcb_store_colors,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,Ptr{xcb_coloritem_t}),c,cmap,items_len,items)
end

function xcb_store_named_color_sizeof(_buffer)
    ccall((:xcb_store_named_color_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_store_named_color_checked(c,flags::UInt8,cmap::xcb_colormap_t,pixel::UInt32,name_len::UInt16,name)
    ccall((:xcb_store_named_color_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt32,UInt16,Cstring),c,flags,cmap,pixel,name_len,name)
end

function xcb_store_named_color(c,flags::UInt8,cmap::xcb_colormap_t,pixel::UInt32,name_len::UInt16,name)
    ccall((:xcb_store_named_color,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_colormap_t,UInt32,UInt16,Cstring),c,flags,cmap,pixel,name_len,name)
end

function xcb_rgb_next(i)
    ccall((:xcb_rgb_next,xcb),Void,(Ptr{xcb_rgb_iterator_t},),i)
end

function xcb_rgb_end(i::xcb_rgb_iterator_t)
    ccall((:xcb_rgb_end,xcb),xcb_generic_iterator_t,(xcb_rgb_iterator_t,),i)
end

function xcb_query_colors_sizeof(_buffer,pixels_len::UInt32)
    ccall((:xcb_query_colors_sizeof,xcb),Cint,(Ptr{Void},UInt32),_buffer,pixels_len)
end

function xcb_query_colors(c,cmap::xcb_colormap_t,pixels_len::UInt32,pixels)
    ccall((:xcb_query_colors,xcb),xcb_query_colors_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,Ptr{UInt32}),c,cmap,pixels_len,pixels)
end

function xcb_query_colors_unchecked(c,cmap::xcb_colormap_t,pixels_len::UInt32,pixels)
    ccall((:xcb_query_colors_unchecked,xcb),xcb_query_colors_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt32,Ptr{UInt32}),c,cmap,pixels_len,pixels)
end

function xcb_query_colors_colors(R)
    ccall((:xcb_query_colors_colors,xcb),Ptr{xcb_rgb_t},(Ptr{xcb_query_colors_reply_t},),R)
end

function xcb_query_colors_colors_length(R)
    ccall((:xcb_query_colors_colors_length,xcb),Cint,(Ptr{xcb_query_colors_reply_t},),R)
end

function xcb_query_colors_colors_iterator(R)
    ccall((:xcb_query_colors_colors_iterator,xcb),xcb_rgb_iterator_t,(Ptr{xcb_query_colors_reply_t},),R)
end

function xcb_query_colors_reply(c,cookie::xcb_query_colors_cookie_t,e)
    ccall((:xcb_query_colors_reply,xcb),Ptr{xcb_query_colors_reply_t},(Ptr{xcb_connection_t},xcb_query_colors_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_lookup_color_sizeof(_buffer)
    ccall((:xcb_lookup_color_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_lookup_color(c,cmap::xcb_colormap_t,name_len::UInt16,name)
    ccall((:xcb_lookup_color,xcb),xcb_lookup_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,Cstring),c,cmap,name_len,name)
end

function xcb_lookup_color_unchecked(c,cmap::xcb_colormap_t,name_len::UInt16,name)
    ccall((:xcb_lookup_color_unchecked,xcb),xcb_lookup_color_cookie_t,(Ptr{xcb_connection_t},xcb_colormap_t,UInt16,Cstring),c,cmap,name_len,name)
end

function xcb_lookup_color_reply(c,cookie::xcb_lookup_color_cookie_t,e)
    ccall((:xcb_lookup_color_reply,xcb),Ptr{xcb_lookup_color_reply_t},(Ptr{xcb_connection_t},xcb_lookup_color_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_create_cursor_checked(c,cid::xcb_cursor_t,source::xcb_pixmap_t,mask::xcb_pixmap_t,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16,x::UInt16,y::UInt16)
    ccall((:xcb_create_cursor_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_pixmap_t,xcb_pixmap_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cid,source,mask,fore_red,fore_green,fore_blue,back_red,back_green,back_blue,x,y)
end

function xcb_create_cursor(c,cid::xcb_cursor_t,source::xcb_pixmap_t,mask::xcb_pixmap_t,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16,x::UInt16,y::UInt16)
    ccall((:xcb_create_cursor,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_pixmap_t,xcb_pixmap_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cid,source,mask,fore_red,fore_green,fore_blue,back_red,back_green,back_blue,x,y)
end

function xcb_create_glyph_cursor_checked(c,cid::xcb_cursor_t,source_font::xcb_font_t,mask_font::xcb_font_t,source_char::UInt16,mask_char::UInt16,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16)
    ccall((:xcb_create_glyph_cursor_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_font_t,xcb_font_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cid,source_font,mask_font,source_char,mask_char,fore_red,fore_green,fore_blue,back_red,back_green,back_blue)
end

function xcb_create_glyph_cursor(c,cid::xcb_cursor_t,source_font::xcb_font_t,mask_font::xcb_font_t,source_char::UInt16,mask_char::UInt16,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16)
    ccall((:xcb_create_glyph_cursor,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,xcb_font_t,xcb_font_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cid,source_font,mask_font,source_char,mask_char,fore_red,fore_green,fore_blue,back_red,back_green,back_blue)
end

function xcb_free_cursor_checked(c,cursor::xcb_cursor_t)
    ccall((:xcb_free_cursor_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t),c,cursor)
end

function xcb_free_cursor(c,cursor::xcb_cursor_t)
    ccall((:xcb_free_cursor,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t),c,cursor)
end

function xcb_recolor_cursor_checked(c,cursor::xcb_cursor_t,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16)
    ccall((:xcb_recolor_cursor_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cursor,fore_red,fore_green,fore_blue,back_red,back_green,back_blue)
end

function xcb_recolor_cursor(c,cursor::xcb_cursor_t,fore_red::UInt16,fore_green::UInt16,fore_blue::UInt16,back_red::UInt16,back_green::UInt16,back_blue::UInt16)
    ccall((:xcb_recolor_cursor,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_cursor_t,UInt16,UInt16,UInt16,UInt16,UInt16,UInt16),c,cursor,fore_red,fore_green,fore_blue,back_red,back_green,back_blue)
end

function xcb_query_best_size(c,_class::UInt8,drawable::xcb_drawable_t,width::UInt16,height::UInt16)
    ccall((:xcb_query_best_size,xcb),xcb_query_best_size_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,UInt16,UInt16),c,_class,drawable,width,height)
end

function xcb_query_best_size_unchecked(c,_class::UInt8,drawable::xcb_drawable_t,width::UInt16,height::UInt16)
    ccall((:xcb_query_best_size_unchecked,xcb),xcb_query_best_size_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_drawable_t,UInt16,UInt16),c,_class,drawable,width,height)
end

function xcb_query_best_size_reply(c,cookie::xcb_query_best_size_cookie_t,e)
    ccall((:xcb_query_best_size_reply,xcb),Ptr{xcb_query_best_size_reply_t},(Ptr{xcb_connection_t},xcb_query_best_size_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_query_extension_sizeof(_buffer)
    ccall((:xcb_query_extension_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_query_extension(c,name_len::UInt16,name)
    ccall((:xcb_query_extension,xcb),xcb_query_extension_cookie_t,(Ptr{xcb_connection_t},UInt16,Cstring),c,name_len,name)
end

function xcb_query_extension_unchecked(c,name_len::UInt16,name)
    ccall((:xcb_query_extension_unchecked,xcb),xcb_query_extension_cookie_t,(Ptr{xcb_connection_t},UInt16,Cstring),c,name_len,name)
end

function xcb_query_extension_reply(c,cookie::xcb_query_extension_cookie_t,e)
    ccall((:xcb_query_extension_reply,xcb),Ptr{xcb_query_extension_reply_t},(Ptr{xcb_connection_t},xcb_query_extension_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_list_extensions_sizeof(_buffer)
    ccall((:xcb_list_extensions_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_extensions(c)
    ccall((:xcb_list_extensions,xcb),xcb_list_extensions_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_list_extensions_unchecked(c)
    ccall((:xcb_list_extensions_unchecked,xcb),xcb_list_extensions_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_list_extensions_names_length(R)
    ccall((:xcb_list_extensions_names_length,xcb),Cint,(Ptr{xcb_list_extensions_reply_t},),R)
end

function xcb_list_extensions_names_iterator(R)
    ccall((:xcb_list_extensions_names_iterator,xcb),xcb_str_iterator_t,(Ptr{xcb_list_extensions_reply_t},),R)
end

function xcb_list_extensions_reply(c,cookie::xcb_list_extensions_cookie_t,e)
    ccall((:xcb_list_extensions_reply,xcb),Ptr{xcb_list_extensions_reply_t},(Ptr{xcb_connection_t},xcb_list_extensions_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_change_keyboard_mapping_sizeof(_buffer)
    ccall((:xcb_change_keyboard_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_keyboard_mapping_checked(c,keycode_count::UInt8,first_keycode::xcb_keycode_t,keysyms_per_keycode::UInt8,keysyms)
    ccall((:xcb_change_keyboard_mapping_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_keycode_t,UInt8,Ptr{xcb_keysym_t}),c,keycode_count,first_keycode,keysyms_per_keycode,keysyms)
end

function xcb_change_keyboard_mapping(c,keycode_count::UInt8,first_keycode::xcb_keycode_t,keysyms_per_keycode::UInt8,keysyms)
    ccall((:xcb_change_keyboard_mapping,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,xcb_keycode_t,UInt8,Ptr{xcb_keysym_t}),c,keycode_count,first_keycode,keysyms_per_keycode,keysyms)
end

function xcb_get_keyboard_mapping_sizeof(_buffer)
    ccall((:xcb_get_keyboard_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_keyboard_mapping(c,first_keycode::xcb_keycode_t,count::UInt8)
    ccall((:xcb_get_keyboard_mapping,xcb),xcb_get_keyboard_mapping_cookie_t,(Ptr{xcb_connection_t},xcb_keycode_t,UInt8),c,first_keycode,count)
end

function xcb_get_keyboard_mapping_unchecked(c,first_keycode::xcb_keycode_t,count::UInt8)
    ccall((:xcb_get_keyboard_mapping_unchecked,xcb),xcb_get_keyboard_mapping_cookie_t,(Ptr{xcb_connection_t},xcb_keycode_t,UInt8),c,first_keycode,count)
end

function xcb_get_keyboard_mapping_keysyms(R)
    ccall((:xcb_get_keyboard_mapping_keysyms,xcb),Ptr{xcb_keysym_t},(Ptr{xcb_get_keyboard_mapping_reply_t},),R)
end

function xcb_get_keyboard_mapping_keysyms_length(R)
    ccall((:xcb_get_keyboard_mapping_keysyms_length,xcb),Cint,(Ptr{xcb_get_keyboard_mapping_reply_t},),R)
end

function xcb_get_keyboard_mapping_keysyms_end(R)
    ccall((:xcb_get_keyboard_mapping_keysyms_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_keyboard_mapping_reply_t},),R)
end

function xcb_get_keyboard_mapping_reply(c,cookie::xcb_get_keyboard_mapping_cookie_t,e)
    ccall((:xcb_get_keyboard_mapping_reply,xcb),Ptr{xcb_get_keyboard_mapping_reply_t},(Ptr{xcb_connection_t},xcb_get_keyboard_mapping_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_change_keyboard_control_sizeof(_buffer)
    ccall((:xcb_change_keyboard_control_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_keyboard_control_checked(c,value_mask::UInt32,value_list)
    ccall((:xcb_change_keyboard_control_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt32,Ptr{UInt32}),c,value_mask,value_list)
end

function xcb_change_keyboard_control(c,value_mask::UInt32,value_list)
    ccall((:xcb_change_keyboard_control,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt32,Ptr{UInt32}),c,value_mask,value_list)
end

function xcb_get_keyboard_control(c)
    ccall((:xcb_get_keyboard_control,xcb),xcb_get_keyboard_control_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_keyboard_control_unchecked(c)
    ccall((:xcb_get_keyboard_control_unchecked,xcb),xcb_get_keyboard_control_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_keyboard_control_reply(c,cookie::xcb_get_keyboard_control_cookie_t,e)
    ccall((:xcb_get_keyboard_control_reply,xcb),Ptr{xcb_get_keyboard_control_reply_t},(Ptr{xcb_connection_t},xcb_get_keyboard_control_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_bell_checked(c,percent::Int8)
    ccall((:xcb_bell_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int8),c,percent)
end

function xcb_bell(c,percent::Int8)
    ccall((:xcb_bell,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int8),c,percent)
end

function xcb_change_pointer_control_checked(c,acceleration_numerator::Int16,acceleration_denominator::Int16,threshold::Int16,do_acceleration::UInt8,do_threshold::UInt8)
    ccall((:xcb_change_pointer_control_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int16,Int16,Int16,UInt8,UInt8),c,acceleration_numerator,acceleration_denominator,threshold,do_acceleration,do_threshold)
end

function xcb_change_pointer_control(c,acceleration_numerator::Int16,acceleration_denominator::Int16,threshold::Int16,do_acceleration::UInt8,do_threshold::UInt8)
    ccall((:xcb_change_pointer_control,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int16,Int16,Int16,UInt8,UInt8),c,acceleration_numerator,acceleration_denominator,threshold,do_acceleration,do_threshold)
end

function xcb_get_pointer_control(c)
    ccall((:xcb_get_pointer_control,xcb),xcb_get_pointer_control_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_pointer_control_unchecked(c)
    ccall((:xcb_get_pointer_control_unchecked,xcb),xcb_get_pointer_control_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_pointer_control_reply(c,cookie::xcb_get_pointer_control_cookie_t,e)
    ccall((:xcb_get_pointer_control_reply,xcb),Ptr{xcb_get_pointer_control_reply_t},(Ptr{xcb_connection_t},xcb_get_pointer_control_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_set_screen_saver_checked(c,timeout::Int16,interval::Int16,prefer_blanking::UInt8,allow_exposures::UInt8)
    ccall((:xcb_set_screen_saver_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int16,Int16,UInt8,UInt8),c,timeout,interval,prefer_blanking,allow_exposures)
end

function xcb_set_screen_saver(c,timeout::Int16,interval::Int16,prefer_blanking::UInt8,allow_exposures::UInt8)
    ccall((:xcb_set_screen_saver,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},Int16,Int16,UInt8,UInt8),c,timeout,interval,prefer_blanking,allow_exposures)
end

function xcb_get_screen_saver(c)
    ccall((:xcb_get_screen_saver,xcb),xcb_get_screen_saver_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_screen_saver_unchecked(c)
    ccall((:xcb_get_screen_saver_unchecked,xcb),xcb_get_screen_saver_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_screen_saver_reply(c,cookie::xcb_get_screen_saver_cookie_t,e)
    ccall((:xcb_get_screen_saver_reply,xcb),Ptr{xcb_get_screen_saver_reply_t},(Ptr{xcb_connection_t},xcb_get_screen_saver_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_change_hosts_sizeof(_buffer)
    ccall((:xcb_change_hosts_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_change_hosts_checked(c,mode::UInt8,family::UInt8,address_len::UInt16,address)
    ccall((:xcb_change_hosts_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,UInt8,UInt16,Ptr{UInt8}),c,mode,family,address_len,address)
end

function xcb_change_hosts(c,mode::UInt8,family::UInt8,address_len::UInt16,address)
    ccall((:xcb_change_hosts,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8,UInt8,UInt16,Ptr{UInt8}),c,mode,family,address_len,address)
end

function xcb_host_sizeof(_buffer)
    ccall((:xcb_host_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_host_address(R)
    ccall((:xcb_host_address,xcb),Ptr{UInt8},(Ptr{xcb_host_t},),R)
end

function xcb_host_address_length(R)
    ccall((:xcb_host_address_length,xcb),Cint,(Ptr{xcb_host_t},),R)
end

function xcb_host_address_end(R)
    ccall((:xcb_host_address_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_host_t},),R)
end

function xcb_host_next(i)
    ccall((:xcb_host_next,xcb),Void,(Ptr{xcb_host_iterator_t},),i)
end

function xcb_host_end(i::xcb_host_iterator_t)
    ccall((:xcb_host_end,xcb),xcb_generic_iterator_t,(xcb_host_iterator_t,),i)
end

function xcb_list_hosts_sizeof(_buffer)
    ccall((:xcb_list_hosts_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_list_hosts(c)
    ccall((:xcb_list_hosts,xcb),xcb_list_hosts_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_list_hosts_unchecked(c)
    ccall((:xcb_list_hosts_unchecked,xcb),xcb_list_hosts_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_list_hosts_hosts_length(R)
    ccall((:xcb_list_hosts_hosts_length,xcb),Cint,(Ptr{xcb_list_hosts_reply_t},),R)
end

function xcb_list_hosts_hosts_iterator(R)
    ccall((:xcb_list_hosts_hosts_iterator,xcb),xcb_host_iterator_t,(Ptr{xcb_list_hosts_reply_t},),R)
end

function xcb_list_hosts_reply(c,cookie::xcb_list_hosts_cookie_t,e)
    ccall((:xcb_list_hosts_reply,xcb),Ptr{xcb_list_hosts_reply_t},(Ptr{xcb_connection_t},xcb_list_hosts_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_set_access_control_checked(c,mode::UInt8)
    ccall((:xcb_set_access_control_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_set_access_control(c,mode::UInt8)
    ccall((:xcb_set_access_control,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_set_close_down_mode_checked(c,mode::UInt8)
    ccall((:xcb_set_close_down_mode_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_set_close_down_mode(c,mode::UInt8)
    ccall((:xcb_set_close_down_mode,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_kill_client_checked(c,resource::UInt32)
    ccall((:xcb_kill_client_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt32),c,resource)
end

function xcb_kill_client(c,resource::UInt32)
    ccall((:xcb_kill_client,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt32),c,resource)
end

function xcb_rotate_properties_sizeof(_buffer)
    ccall((:xcb_rotate_properties_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_rotate_properties_checked(c,window::xcb_window_t,atoms_len::UInt16,delta::Int16,atoms)
    ccall((:xcb_rotate_properties_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt16,Int16,Ptr{xcb_atom_t}),c,window,atoms_len,delta,atoms)
end

function xcb_rotate_properties(c,window::xcb_window_t,atoms_len::UInt16,delta::Int16,atoms)
    ccall((:xcb_rotate_properties,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},xcb_window_t,UInt16,Int16,Ptr{xcb_atom_t}),c,window,atoms_len,delta,atoms)
end

function xcb_force_screen_saver_checked(c,mode::UInt8)
    ccall((:xcb_force_screen_saver_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_force_screen_saver(c,mode::UInt8)
    ccall((:xcb_force_screen_saver,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},UInt8),c,mode)
end

function xcb_set_pointer_mapping_sizeof(_buffer)
    ccall((:xcb_set_pointer_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_set_pointer_mapping(c,map_len::UInt8,map)
    ccall((:xcb_set_pointer_mapping,xcb),xcb_set_pointer_mapping_cookie_t,(Ptr{xcb_connection_t},UInt8,Ptr{UInt8}),c,map_len,map)
end

function xcb_set_pointer_mapping_unchecked(c,map_len::UInt8,map)
    ccall((:xcb_set_pointer_mapping_unchecked,xcb),xcb_set_pointer_mapping_cookie_t,(Ptr{xcb_connection_t},UInt8,Ptr{UInt8}),c,map_len,map)
end

function xcb_set_pointer_mapping_reply(c,cookie::xcb_set_pointer_mapping_cookie_t,e)
    ccall((:xcb_set_pointer_mapping_reply,xcb),Ptr{xcb_set_pointer_mapping_reply_t},(Ptr{xcb_connection_t},xcb_set_pointer_mapping_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_get_pointer_mapping_sizeof(_buffer)
    ccall((:xcb_get_pointer_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_pointer_mapping(c)
    ccall((:xcb_get_pointer_mapping,xcb),xcb_get_pointer_mapping_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_pointer_mapping_unchecked(c)
    ccall((:xcb_get_pointer_mapping_unchecked,xcb),xcb_get_pointer_mapping_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_pointer_mapping_map(R)
    ccall((:xcb_get_pointer_mapping_map,xcb),Ptr{UInt8},(Ptr{xcb_get_pointer_mapping_reply_t},),R)
end

function xcb_get_pointer_mapping_map_length(R)
    ccall((:xcb_get_pointer_mapping_map_length,xcb),Cint,(Ptr{xcb_get_pointer_mapping_reply_t},),R)
end

function xcb_get_pointer_mapping_map_end(R)
    ccall((:xcb_get_pointer_mapping_map_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_pointer_mapping_reply_t},),R)
end

function xcb_get_pointer_mapping_reply(c,cookie::xcb_get_pointer_mapping_cookie_t,e)
    ccall((:xcb_get_pointer_mapping_reply,xcb),Ptr{xcb_get_pointer_mapping_reply_t},(Ptr{xcb_connection_t},xcb_get_pointer_mapping_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_set_modifier_mapping_sizeof(_buffer)
    ccall((:xcb_set_modifier_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_set_modifier_mapping(c,keycodes_per_modifier::UInt8,keycodes)
    ccall((:xcb_set_modifier_mapping,xcb),xcb_set_modifier_mapping_cookie_t,(Ptr{xcb_connection_t},UInt8,Ptr{xcb_keycode_t}),c,keycodes_per_modifier,keycodes)
end

function xcb_set_modifier_mapping_unchecked(c,keycodes_per_modifier::UInt8,keycodes)
    ccall((:xcb_set_modifier_mapping_unchecked,xcb),xcb_set_modifier_mapping_cookie_t,(Ptr{xcb_connection_t},UInt8,Ptr{xcb_keycode_t}),c,keycodes_per_modifier,keycodes)
end

function xcb_set_modifier_mapping_reply(c,cookie::xcb_set_modifier_mapping_cookie_t,e)
    ccall((:xcb_set_modifier_mapping_reply,xcb),Ptr{xcb_set_modifier_mapping_reply_t},(Ptr{xcb_connection_t},xcb_set_modifier_mapping_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_get_modifier_mapping_sizeof(_buffer)
    ccall((:xcb_get_modifier_mapping_sizeof,xcb),Cint,(Ptr{Void},),_buffer)
end

function xcb_get_modifier_mapping(c)
    ccall((:xcb_get_modifier_mapping,xcb),xcb_get_modifier_mapping_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_modifier_mapping_unchecked(c)
    ccall((:xcb_get_modifier_mapping_unchecked,xcb),xcb_get_modifier_mapping_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_get_modifier_mapping_keycodes(R)
    ccall((:xcb_get_modifier_mapping_keycodes,xcb),Ptr{xcb_keycode_t},(Ptr{xcb_get_modifier_mapping_reply_t},),R)
end

function xcb_get_modifier_mapping_keycodes_length(R)
    ccall((:xcb_get_modifier_mapping_keycodes_length,xcb),Cint,(Ptr{xcb_get_modifier_mapping_reply_t},),R)
end

function xcb_get_modifier_mapping_keycodes_end(R)
    ccall((:xcb_get_modifier_mapping_keycodes_end,xcb),xcb_generic_iterator_t,(Ptr{xcb_get_modifier_mapping_reply_t},),R)
end

function xcb_get_modifier_mapping_reply(c,cookie::xcb_get_modifier_mapping_cookie_t,e)
    ccall((:xcb_get_modifier_mapping_reply,xcb),Ptr{xcb_get_modifier_mapping_reply_t},(Ptr{xcb_connection_t},xcb_get_modifier_mapping_cookie_t,Ptr{Ptr{xcb_generic_error_t}}),c,cookie,e)
end

function xcb_no_operation_checked(c)
    ccall((:xcb_no_operation_checked,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_no_operation(c)
    ccall((:xcb_no_operation,xcb),xcb_void_cookie_t,(Ptr{xcb_connection_t},),c)
end

function xcb_flush(c)
    ccall((:xcb_flush,xcb),Cint,(Ptr{xcb_connection_t},),c)
end

function xcb_get_maximum_request_length(c)
    ccall((:xcb_get_maximum_request_length,xcb),UInt32,(Ptr{xcb_connection_t},),c)
end

function xcb_prefetch_maximum_request_length(c)
    ccall((:xcb_prefetch_maximum_request_length,xcb),Void,(Ptr{xcb_connection_t},),c)
end

function xcb_wait_for_event(c)
    ccall((:xcb_wait_for_event,xcb),Ptr{xcb_generic_event_t},(Ptr{xcb_connection_t},),c)
end

function xcb_poll_for_event(c)
    ccall((:xcb_poll_for_event,xcb),Ptr{xcb_generic_event_t},(Ptr{xcb_connection_t},),c)
end

function xcb_poll_for_queued_event(c)
    ccall((:xcb_poll_for_queued_event,xcb),Ptr{xcb_generic_event_t},(Ptr{xcb_connection_t},),c)
end

function xcb_poll_for_special_event(c,se)
    ccall((:xcb_poll_for_special_event,xcb),Ptr{xcb_generic_event_t},(Ptr{xcb_connection_t},Ptr{xcb_special_event_t}),c,se)
end

function xcb_wait_for_special_event(c,se)
    ccall((:xcb_wait_for_special_event,xcb),Ptr{xcb_generic_event_t},(Ptr{xcb_connection_t},Ptr{xcb_special_event_t}),c,se)
end

function xcb_register_for_special_xge(c,ext,eid::UInt32,stamp)
    ccall((:xcb_register_for_special_xge,xcb),Ptr{xcb_special_event_t},(Ptr{xcb_connection_t},Ptr{xcb_extension_t},UInt32,Ptr{UInt32}),c,ext,eid,stamp)
end

function xcb_unregister_for_special_event(c,se)
    ccall((:xcb_unregister_for_special_event,xcb),Void,(Ptr{xcb_connection_t},Ptr{xcb_special_event_t}),c,se)
end

function xcb_request_check(c,cookie::xcb_void_cookie_t)
    ccall((:xcb_request_check,xcb),Ptr{xcb_generic_error_t},(Ptr{xcb_connection_t},xcb_void_cookie_t),c,cookie)
end

function xcb_discard_reply(c,sequence::UInt32)
    ccall((:xcb_discard_reply,xcb),Void,(Ptr{xcb_connection_t},UInt32),c,sequence)
end

function xcb_get_extension_data(c,ext)
    ccall((:xcb_get_extension_data,xcb),Ptr{xcb_query_extension_reply_t},(Ptr{xcb_connection_t},Ptr{xcb_extension_t}),c,ext)
end

function xcb_prefetch_extension_data(c,ext)
    ccall((:xcb_prefetch_extension_data,xcb),Void,(Ptr{xcb_connection_t},Ptr{xcb_extension_t}),c,ext)
end

function xcb_get_setup(c)
    ccall((:xcb_get_setup,xcb),Ptr{xcb_setup_t},(Ptr{xcb_connection_t},),c)
end

function xcb_get_file_descriptor(c)
    ccall((:xcb_get_file_descriptor,xcb),Cint,(Ptr{xcb_connection_t},),c)
end

function xcb_connection_has_error(c)
    ccall((:xcb_connection_has_error,xcb),Cint,(Ptr{xcb_connection_t},),c)
end

function xcb_connect_to_fd(fd::Cint,auth_info)
    ccall((:xcb_connect_to_fd,xcb),Ptr{xcb_connection_t},(Cint,Ptr{xcb_auth_info_t}),fd,auth_info)
end

function xcb_disconnect(c)
    ccall((:xcb_disconnect,xcb),Void,(Ptr{xcb_connection_t},),c)
end

function xcb_parse_display(name,host,display,screen)
    ccall((:xcb_parse_display,xcb),Cint,(Cstring,Ptr{Cstring},Ptr{Cint},Ptr{Cint}),name,host,display,screen)
end

function xcb_connect(displayname,screenp)
    ccall((:xcb_connect,xcb),Ptr{xcb_connection_t},(Cstring,Ptr{Cint}),displayname,screenp)
end

function xcb_connect_to_display_with_auth_info(display,auth,screen)
    ccall((:xcb_connect_to_display_with_auth_info,xcb),Ptr{xcb_connection_t},(Cstring,Ptr{xcb_auth_info_t},Ptr{Cint}),display,auth,screen)
end

function xcb_generate_id(c)
    ccall((:xcb_generate_id,xcb),UInt32,(Ptr{xcb_connection_t},),c)
end
