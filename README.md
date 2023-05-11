# godot-retro-vector
A godot plugin for imitating 3D vector graphics.

I've been trying to find a good method for imitating 3D vectors graphics for a while in Godot, a few years backs I implemented some obtuse solutions which weren’t very friendly to work with, and have recently simplified the process down to just a shader, although it is missing quite a few features that I originally had I do plan on implementing those again soon.


# How to use
As currently this is just a shader all you need to do is apply that shader to the mesh instance.

The shader does not render a wireframe of a mesh, the mesh needs to only be edges. To do this in blender, select the entire mesh in edit mode and delete only faces. 

Exporting from blender is the same process as with a normal mesh, but ticking this option in the gltf export `Data->Mesh->Loose Edges` otherwise it won't export just the edges.

Two blender files are included for a static and animated mesh along with the [export settings](https://github.com/Big-Burden/godot-retro-vector/tree/main/addons/retro_vector/demos/assets/source/Vector.py), these need to be placed in [`blender user folder`](https://docs.blender.org/manual/en/2.79/getting_started/installing/configuration/directories.html)`\scripts\presets\operator\export_scene.gltf\`


# Examples

[Showcase demo](https://youtu.be/gm0hy79H7Q0)

[Space demo](https://youtu.be/6KEKQMlwxR8)

[Battlezone](https://youtu.be/a7oMNCu6pU4)