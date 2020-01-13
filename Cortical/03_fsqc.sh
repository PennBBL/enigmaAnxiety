#!/bin/bash

###This is currently not working for the cluster. You need to mount the cluster on your local machine and use a local copy of freesurfer.
fs_path="/data/joy/BBL/studies/pnc/processedData/structural/freesurfer53/"
pushd .
cd /data/jux/BBL/projects/enigmaAnxiety/cortical_output/fsqcdir #this is where the outputs go
echo "<html>" 																						>  index.html
echo "<table>"																						>> index.html

cat bblid_scandir.csv | while IFS="," read bblid scandir; do
	export SUBJECTS_DIR="${fs_path}${bblid}"
	sub=$bblid
	scan=$scandir
	echo "<tr>"																						>> index.html
	echo "<td><a href=\"file:"$sub".lh.lat.hr.tif\"><img src=\""$sub".lh.lat.lr.tif\"></a></td>"	>> index.html
	echo "<td><a href=\"file:"$sub".lh.med.hr.tif\"><img src=\""$sub".lh.med.lr.tif\"></a></td>"	>> index.html
	echo "<td><a href=\"file:"$sub".rh.lat.hr.tif\"><img src=\""$sub".rh.lat.lr.tif\"></a></td>"	>> index.html
	echo "<td><a href=\"file:"$sub".rh.med.hr.tif\"><img src=\""$sub".rh.med.lr.tif\"></a></td>"	>> index.html
	echo "</tr>"																					>> index.html
	echo "<tr>"																						>> index.html
	echo "<td colspan=4><center>"$sub"</center><br></td>"											>> index.html
	echo "</tr>"																					>> index.html
	
	
	echo "labl_import_annotation \"aparc.annot\""	> tmp.tcl
	echo "scale_brain 1.35"							>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".lh.lat.hr.tif"			>>tmp.tcl
	echo "rotate_brain_y 180.0"						>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".lh.med.hr.tif"			>>tmp.tcl
	echo "resize_window 300"						>>tmp.tcl
	echo "rotate_brain_y -180.0"					>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".lh.lat.lr.tif"			>>tmp.tcl
	echo "rotate_brain_y 180.0"						>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".lh.med.lr.tif"			>>tmp.tcl
	echo "exit 0"									>>tmp.tcl
	tksurfer $scan lh pial -tcl tmp.tcl

	echo "labl_import_annotation \"aparc.annot\""	> tmp.tcl
	echo "scale_brain 1.35"							>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".rh.lat.hr.tif"			>>tmp.tcl
	echo "rotate_brain_y 180.0"						>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".rh.med.hr.tif"			>>tmp.tcl
	echo "rotate_brain_y -180.0"					>>tmp.tcl
	echo "resize_window 300"						>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".rh.lat.lr.tif"			>>tmp.tcl
	echo "rotate_brain_y 180.0"						>>tmp.tcl
	echo "redraw"									>>tmp.tcl
	echo "save_tiff "$sub".rh.med.lr.tif"			>>tmp.tcl
	echo "exit 0"									>>tmp.tcl
	tksurfer $scan rh pial -tcl tmp.tcl
	
	rm tmp.tcl
done;
echo "</table>"										>> index.html
echo "</html>"										>> index.html

popd


