rm -rf Blender_ms/

find . -name "ID_s.*" -delete
find . -name "ns_x.*" -delete
find . -name "ns_y.*" -delete
find . -name "ns_z.*" -delete
find . -name "1_nsdata.*" -delete
find . -name "0_wsdata.*" -delete
find . -name "components.NWP.tcat" -delete
find . -name "max_nw_edge_PLUS.*" -delete
find . -name "2_nwdata.*" -delete
find . -name "components.WP.tcat" -delete
find . -name "mean_curvature_evolution.tcat.*" -delete
find . -name "Approximations.tcat.*" -delete
find . -name "geometry.tcat" -delete
find . -name "min_nw_edge_MIN.*" -delete
find . -name "ID.*" -delete
find . -name "geometry.tcat.*" -delete
find . -name "nwBubble.txt" -delete
find . -name "ID2.*" -delete
find . -name "gradprime_dpspeed_thm.tcat.*" -delete
find . -name "LBM.visit" -delete
find . -name "gradprime_n_thm.tcat.*" -delete
find . -name "qDirection.*" -delete
find . -name "OffsetDist.*" -delete
find . -name "timelog.tcat" -delete
find . -name "Orientation_Tensor.*" -delete
find . -name "lbpm_id_map.txt" -delete
find . -name "timelog.tcat.*" -delete
find . -name "SignDist.*" -delete
find . -name "libbqA.*" -delete
find . -name "VFmask.*" -delete
find . -name "libbqBC.*" -delete
find . -type d -name "vis*" -prune -exec rm -rf {} \;
