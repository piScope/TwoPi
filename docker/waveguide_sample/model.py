import os
try:
    from mpi4py import MPI
    num_proc = MPI.COMM_WORLD.size
    use_parallel=num_proc > 1
except:
    use_parallel=False
import  petram.mfem_config as mfem_config
mfem_config.use_parallel = use_parallel

debug_level = 0

from numpy.lib.type_check import real
from numpy import cos
from numpy import log2
from numpy import log
from numpy.core.multiarray import vdot
from numpy.core.multiarray import dot
from numpy.lib.type_check import imag
from numpy.core.multiarray import array
from numpy import arctan2
from numpy import arctan
from numpy import abs
from numpy import sqrt
from numpy import exp
from numpy.core.fromnumeric import sum
from numpy.core.numeric import cross
from numpy import tan
from numpy import log10
from numpy import sin
from numpy import conj

from petram.mfem_model import MFEM_ModelRoot
from petram.mfem_model import MFEM_GeneralRoot
from petram.mfem_model import MFEM_GeomRoot
from petram.geom.gmsh_geom_model import GmshGeom
from petram.geom.gmsh_primitives import Rect
from petram.geom.gmsh_primitives import Extrude
from petram.mfem_model import MFEM_MeshRoot
from petram.mesh.gmsh_mesh_model import GmshMesh
from petram.mesh.gmsh_mesh_actions import FreeVolume
from petram.mesh.mesh_model import MeshGroup
from petram.mesh.mesh_model import MeshFile
from petram.mfem_model import MFEM_PhysRoot
from petram.phys.em3d.em3d_model import EM3D
from petram.phys.em3d.em3d_model import EM3D_DefDomain
from petram.phys.em3d.em3d_vac import EM3D_Vac
from petram.phys.em3d.em3d_model import EM3D_DefBdry
from petram.phys.em3d.em3d_pec import EM3D_PEC
from petram.phys.em3d.em3d_port import EM3D_Port
from petram.phys.em3d.em3d_model import EM3D_DefPair
from petram.mfem_model import MFEM_InitRoot
from petram.mfem_model import MFEM_SolverRoot
from petram.solver.solver_model import SolveStep
from petram.solver.std_solver_model import StdSolver
from petram.solver.mumps_model import MUMPS
from collections import OrderedDict

def make_model():
    obj1 = MFEM_ModelRoot()
    obj1.root_path = ''
    obj2 = obj1.add_node(name = "General", cls = MFEM_GeneralRoot)
    obj2.ns_name = "global"
    obj3 = obj1.add_node(name = "Geometry", cls = MFEM_GeomRoot)
    obj4 = obj3.add_node(name = "GmshGeom1", cls = GmshGeom)
    obj4.geom_timestamp = 'Tue Aug 21 14:33:16 2018'
    obj4.geom_finalized = True
    obj5 = obj4.add_node(name = "Rect1", cls = Rect)
    obj5.edge1_m = '[1, 0, 0]'
    obj5.edge1_x_txt = '0.05'
    obj5.lcar = '0.0'
    obj5.edge1_y = '0'
    obj5.edge1_z = '0'
    obj5.edge1_x = '0.05'
    obj5.corner_m = '[0, 0, 0]'
    obj5.corner_z = '0'
    obj5.corner_x = '0'
    obj5.corner_y = '0'
    obj5.lcar_txt = '0.0'
    obj5.edge2_y_txt = '0.007'
    obj5.edge2_m = '[0, 1, 0]'
    obj5.edge2_y = '0.007'
    obj5.edge2_x = '0'
    obj5.edge2_z = '0'
    obj6 = obj4.add_node(name = "Extrude1", cls = Extrude)
    obj6.exlen = '0.2'
    obj6.ex_target = 'rec1'
    obj6.ex_target_txt = 'rec1'
    obj6.paxis_y = '0'
    obj6.paxis_x = '0'
    obj6.paxis_z = '0'
    obj6.taxis_m = '[0, 0, 1]'
    obj6.paxis_m = '[0, 0, 0]'
    obj6.taxis_y = '0'
    obj6.taxis_x = '0'
    obj6.taxis_z = '1'
    obj6.exlen_txt = '0.2'
    obj7 = obj1.add_node(name = "Mesh", cls = MFEM_MeshRoot)
    obj8 = obj7.add_node(name = "GmshMesh1", cls = GmshMesh)
    obj8.clmin = '1.0'
    obj8.clmax = '1.0'
    obj8.geom_timestamp = 'Tue Aug 21 14:33:16 2018'
    obj9 = obj8.add_node(name = "FreeVolume1", cls = FreeVolume)
    obj9.clmax = '0.01'
    obj9.clmax_txt = '0.01'
    obj10 = obj7.add_node(name = "MeshGroup1", cls = MeshGroup)
    obj11 = obj10.add_node(name = "MeshFile1", cls = MeshFile)
    obj11.refine = 1
    obj11.path = 'waveguide.msh'
    obj12 = obj1.add_node(name = "Phys", cls = MFEM_PhysRoot)
    obj13 = obj12.add_node(name = "EM3D1", cls = EM3D)
    obj13.mesh_idx = 0L
    obj13.freq_txt = '4.6e9'
    obj13.order = 1L
    obj14 = obj13.add_node(name = "Domain", cls = EM3D_DefDomain)
    obj14.epsilonr = '(1+0j)'
    obj14.mur = '(1+0j)'
    obj14.Einit_m = '[0, 0, 0]'
    obj14.sigma = '0j'
    obj14.Einit_y = '0'
    obj14.Einit_x = '0'
    obj14.Einit_z = '0'
    obj15 = obj14.add_node(name = "Vac1", cls = EM3D_Vac)
    obj15.mur_txt = '(1+0j)'
    obj15.epsilonr = '(1+0j)'
    obj15.mur = '(1+0j)'
    obj15.sel_index = [1]
    obj15.sel_index_txt = '1'
    obj15.Einit_m = '[0, 0, 0]'
    obj15.sigma = '0j'
    obj15.sigma_txt = '0j'
    obj15.epsilonr_txt = '(1+0j)'
    obj15.Einit_y = '0'
    obj15.Einit_x = '0'
    obj15.Einit_z = '0'
    obj16 = obj13.add_node(name = "Boundary", cls = EM3D_DefBdry)
    obj16.Einit_m = '[0, 0, 0]'
    obj16.sel_index = []
    obj16.Einit_y = '0'
    obj16.Einit_x = '0'
    obj16.Einit_z = '0'
    obj17 = obj16.add_node(name = "PEC1", cls = EM3D_PEC)
    obj17.Einit_m = '[0, 0, 0]'
    obj17.sel_index = ['remaining']
    obj17.sel_index_txt = 'remaining'
    obj17.Einit_y = '0'
    obj17.Einit_x = '0'
    obj17.Einit_z = '0'
    obj18 = obj16.add_node(name = "Port1", cls = EM3D_Port)
    obj18.mur_txt = '(1+0j)'
    obj18.epsilonr = '(1+0j)'
    obj18.mur = '(1+0j)'
    obj18.sel_index = [1]
    obj18.inc_phase = '0.0'
    obj18.sel_index_txt = '1'
    obj18.port_idx = '1'
    obj18.inc_amp = '1.0'
    obj18.mode = u'TE'
    obj18.epsilonr_txt = '(1+0j)'
    obj19 = obj16.add_node(name = "Port2", cls = EM3D_Port)
    obj19.mur_txt = '(1+0j)'
    obj19.epsilonr = '(1+0j)'
    obj19.mur = '(1+0j)'
    obj19.sel_index = [6]
    obj19.inc_phase = '0.0'
    obj19.sel_index_txt = '6'
    obj19.inc_amp_txt = '0.0'
    obj19.port_idx = '2'
    obj19.inc_amp = '0.0'
    obj19.mode = u'TE'
    obj19.epsilonr_txt = '(1+0j)'
    obj20 = obj13.add_node(name = "Pair", cls = EM3D_DefPair)
    obj21 = obj1.add_node(name = "InitialValue", cls = MFEM_InitRoot)
    obj22 = obj1.add_node(name = "Solver", cls = MFEM_SolverRoot)
    obj23 = obj22.add_node(name = "SolveStep1", cls = SolveStep)
    obj24 = obj23.add_node(name = "StdSolver1", cls = StdSolver)
    obj24.phys_model = 'EM3D1'
    obj25 = obj24.add_node(name = "MUMPS1", cls = MUMPS)
    obj25.log_level = 1L
    obj25.error_ana = u'none'
    return obj1

if __name__ == "__main__":
    if mfem_config.use_parallel:
        from petram.engine import ParallelEngine as Eng
    else:
        from petram.engine import SerialEngine as Eng
    
    import petram.debug as debug
    debug.set_debug_level(debug_level)
    
    model = make_model()
    
    eng = Eng(model = model)
    
    solvers = eng.preprocess_modeldata()
    
    is_first = True
    for s in solvers:
        s.run(eng, is_first=is_first)
        is_first=False
