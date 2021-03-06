\name{NEWS}
\title{News for Package 'Morpho'}
\newcommand{\cpkg}{\href{http://CRAN.R-project.org/package=#1}{\pkg{#1}}}

\section{Changes in Morpho version 2.2 (2014-12-16)}{
  \subsection{New features}{
    \itemize{
      \item slider3d, relaxLM and procSym now allow minimizing
      Procrustes distance
      \item added orientation check in pcAlign to avoid reflections
      \item massive speed improvements in sliding semi-landmarks routines
      \item added options missing/missingList in relaxLM and slider3d to
      allow using semi-landmarks in "thin-air"
      \item added helper function createMissingList
      \item added function points2plane for projecting a
      point/pointcloud onto a plane.
      \item pcAlign with y missing now centers a shape and aligns it by
      its principal axes.
      \item added option pcAlign in procSym and ProcGPA to
  enable/disable alignment of sample by principal axes
    }
  }
  \subsection{bugfixes and minor changes}{
    \itemize{
      \item renamed conv2backf to invertFaces
      \item renamed crossp to crossProduct
      \item renamed tanplan to tangentPlane
      \item reorient faces if reflections are involved in applyTransform
      \item made read.lmdta more versatile
      \item fixed an issue with argument "size" in deformGrid3d
      \item set default method to "vcg" in meshDist
    }
  }
}

\section{Changes in Morpho version 2.1 (2014-09-25)}{
  \subsection{New features}{
    \itemize{
      \item added new function mirror to mirror a landmark configuration
      or a mesh and registering onto the original one.
      \item added new functions retroDeform3d and  retroDeformMesh for removing affine
      deformation from a 3D-meshes and pointclouds
      \item deformGrid3d now also accepts meshes
      \item added function classify for CVA and groupPCA for creating
      classification tables
      \item added new function getTrafo4x4, getTrafoRotaxis,
      computeTransform and applyTransform, for computing and applying
      affine transformations.
      \item new function pcAlign to align meshes and pointclouds by
      their principal axes
      \item added function meshPlaneIntersect to find intersection
      points between a mesh and a plane
      \item added function getFaces to get indices of faces that contain specified vertices 
    }
  }
  \subsection{bugfixes and minor changes}{
    \itemize{
      \item fixed issue with argument sep in typprobClass
      \item added option size in deformGrid3d
      \item fixed argument tol in ray2mesh
      \item fixed rhotol in placePatch if inflate=NULL
      \item fixed NA in colors from meshDist
      \item fixed rmVertex in case no faces remain
      \item changed relaxLM to accept 2D configs
      \item replaced workhorse function in projRead by the faster
      vcgClostKD
      \item made plotNormals to work with homogenous and non-homogeneous
      coordinates
      \item fixed issue in output of CVAdists (wrong attribution of p-value tables)


    }
  }
}

\section{Changes in Morpho version 2.0.3 (2014-05-13)}{
  \itemize{
   \item added support for objects stored in a list in bindArr
   \item made rotreverse an S3 function for matrices and mesh3d
   \item fixed bug in slider3d if pairedLM != 0
   \item fixed pooled within covariance matrix (covW) for single group entries
   \item speed up rotonto, rotonmat by vectorizing
   \item removed junk comments
   \item added fix for weighted Grandmean in CVA (thanks to Anne-Beatrice Defour)
   \item added check for empty patches and curves in cExtract (thanks to M. Friess for pointing that out)
   \item added 'cutMeshPlane' and 'cutSpace' to cut a pointcloud into upper and lower part
   \item added function 'solutionSpace' to calculate the basis of the solution space for Ax=b, with det(A)=0
   \item minor changes in asymPermute (docu and table naming)
   \item enabled multigroup support in asymPermute
   \item added groupmean output in asymPermute
   \item updateNormals: if no faces are present, mesh will be returned unchanged now. quadric faces are converted to triangular ones
   \item add new function 'quad2trimesh' for converting quadric meshes into triangular meshes.
   \item made code in pcaplot3d easier to maintain by creating .pcaplot3d
   \item assigned additional attributes to output of procSym
 }
}

\section{Changes in Morpho version 2.0.2 (2014-02-24)}{
  \itemize{
    \item added function 'fixLMmirror' to estimate missing bilateral
    landmarks
    \item wrote C++ versions of some subroutines to speed up Procrustes
    registration.
    \item added function arrMean3 to calculate fast average of 3D-array
    \item reprojection onto surface in 'slider3d' now can run in
    parallel (only OS X and Linux)
  }
}

\section{Changes in Morpho version 2.0.1 (2014-02-07)}{
  \itemize{
    \item 'createAtlas' has new option "keep.fix" to specifiy landmarks
    that should be kept from sliding in case corrCurves are defined.
  }
}

\section{Changes in Morpho version 2.0 (2014-02-06)}{
 
  \itemize{   
    \item wrote C++ implementation of 'covPCA' (much faster) and added
    bootstrapping option to compute confidence intervals for PC-scores (removed
    obsolete options "mc.cores" and "scores")
    \item all functions calling trimesh-tools are now wrappers for
    much faster implementations from Rvcg
    \item placePatch now runs in parallel
    \item warpmovie3d now allows make movie of deformed mesh AND
    landmarks
  }
  }



\section{Changes in Morpho version 1.99 (2013-12-18)}{
  \subsection{R-code}{
    \itemize{
      \item renamed 'adnormals' to 'updateNormals'
      \item 'permudist' is now massively faster by using C++ code for
      permutation. It can handle more than 2 groups now.
      \item as the new 'permudist' is now implemented in 'groupPCA', it
  gets a boost, too.
      \item added function 'RegScore' to calculate Regression scores as described in Drake & Klingenberg(2008)
      \item added 'CAC' (common allometric component)
      \item added functions 'asymPermute' (assessing directional asymmetry) and 'meanMat' (fast Matrix averaging)
      \item covPCA now returns the distances instead of squared
      distances
      \item added option to revert vecx to translate a matrix back into
      an array containing landmarks
      \item adapted 'ray2mesh' to work in parallel calls and added
      option "mc.cores" in 'placePatch' - even in Windows
      \item added optipn "add" in "meshDist" and "render" to add to
      existing rgl window.
      \item fixed error in in 'placePatch' in case "data" is a matrix 

    }
  }
  \subsection{Package documentation}{
    \itemize{
      \item switched to roxygen2
      \item fixed some docu and added examples in 'pcaplot3d' and 'rotonmat'
      \item added link to PDF-manual in Morpho's help page
      \item commented out the answers in find.outliers to be able to run run_examples(...,run=FALSE) without errors
      \item marked more examples as dontrun, as the usage of roxygen2 allows the detailed check of ALL examples by using run_examples(devtools package). This uses less checking time and keeps CRAN from complaining
    }
  }
  \subsection{Misc}{
    \itemize{
      \item translated all FORTRAN routines into C++ using Rcpp/RcppArmadillo 
    }
  }
}




\section{Changes in Morpho version 1.0 (2013-11-04)}{
  \subsection{R-code}{
    \itemize{
      \item added option "barycoords" in 'closemeshKD' and added normal weighting
      \item made reprojection ind 'slider3d' using multiple cores in case "meshlist" is specified
      \item added option "blockdiag" in 'CreateL' to supress returning blockdiagonal matrix containin Lsubk
      \item significant speedup in calcGamma (responsible for sliding)
      \item added option "meshlist" in 'slider3d' and fixed memory
      allocation problem for orthogonal projection with large amounts of
      landmarks in 'procSym' (underlying routine 'orp')
      \item added autonaming of output in write.pts
      \item 'mergeMeshes' now allows a list of meshes to merge
      \item fixed error in 'mcNNindex' in case k=1
      \item added landmark matrix to output of 'cExtract'
      \item set pointsize to 10 in 'deformGrid3d' in case "type="p""
      \item added options "silent"/"ignore.stdout" to 'ply2mesh',
      'projRead', 'ray2mesh', 'slider3d' and 
      'warp.mesh' to supress terminal output
      \item added option "pt.size" instead of "radius" in 'checkLM' and 'plotAtlas' to control point/sphere size.
      \item added option "fixRepro" in 'slider3d' and 'relaxLM' to supress
      reprojection of fix landmarks onto the surface. This can be useful
      when some fix landmarks are in "thin air".
      \item added support for point cloud export in 'mesh2ply' and 'mesh2obj'
      \item added option "silent" in 'rmUnrefVertex'
      \item fixed error in 'relWarps' preventing it to work for 2D configs
      \item added function 'checkLM'. Useful to visualize if projection by
  'placePatch' was successful by browsing through sample. 
      \item added functions 'placePatch', 'createAtlas' and 'plotAtlas'
  for defining templates and functions to project (semi-) landmarks from
  an atlas onto all specimen in a given sample
      \item fixed missing '-1' subtraction in 'covW'
      \item added function 'mergeMeshes' to concatenate multiple triangular meshes.
      \item made function 'procAOVsym' (procrustes Anova for object
      symmetry) public.
      \item made functions 'cSize', 'mcNNindex', 'meshcube', 'meshres', 'ProcGPA' public.
      \item added option 'info' in 'read.mpp'
      \item merged 'CreateL' and 'CreateL2D'
      \item rewrote large parts of 'CVA', 'groupPCA' and 'permudist' to
  make the code more efficient
      \item 'covPCA' now allows permutation tests to check if pairwise
      distances between covariance matrices are significant and reports rownames for two-group case
      \item removed unnecessary complicated check for empty groups by simply using function 'factor' in 'covW' and 'typprobClass'
      \item white space formatting in code
      \item added option "mshape" to function 'orp' to specify a custom pole for projection
      \item made function 'fx', 'PCAcrova' and 'calcTang_U'
  interntal-only by prefixing function name with '.'
      \item removed unnecessary sinus calculation in 'angle.calc'
    }
  }
  \subsection{Package documentation}{
    \itemize{
      \item added docu and examples for all newly exposed functions (see above)
      \item added examples for 'find.outliers'
      \item added more examples for covPCA, performing permutation tests
      \item added docu for function 'barycenter'
      \item added a lot of examples to docu and documented data(nose)
      \item added documentation for 'angle.calc'
      \item added example in 'relaxLM'
      \item added section "details" in procSym, added example in slider3d
      \item added example for procAOVsym
      \item changed parameters in examples for  'pls2B' and 'relaxLM' to decrease completion time
    }
  }
  \subsection{Misc}{
    \itemize{
      \item changed doParallel from Dependency to Import - needs
  'doParallel' >= 1.06
      \item removed obsolete Fortran code
      \item added minimum version for imported package 'Matrix'(>= 1.0-1)
      \item changed foreach, parallel and rgl (needs rgl version >=
      0.93.963) from 'Depends' to 'Imports' (affecting DESCRIPTION and NAMESPACE)
      \item massive NAMESPACE editing by switching to manual export instead of regular expression export
    }
  }
}


\section{Changes in Morpho version 0.25-1 (2013-08-02)}{
  \subsection{R-code}{
    \itemize{
      \item replaced abind with 'bindArr' in 'fixLMtps' and 'procSym'
      \item moved Distance calculation in 'CVA' to '.CVAdists' and radically cleaned code;
      \item removal of redundant variables in 'groupPCA'
      \item added option 'reflect' to 'procSym' (and underlying functions) and added copyright note for code copied from shapes package
    }
  }
  \subsection{Package documentation}{
    \itemize{
      \item added docu for new data set "boneData"
      \item added examples in 'procSym'
      \item added example for 'tps3d'
    }
  }
  \subsection{Misc}{
    \itemize{
      \item added additional example data (landmarks and a bone surface mesh)
      \item updated DESCRIPTION and README
      \item updated README added sourceforge and github download links
      \item added README.Rd
      \item added NEWS.Rd

    }
  }
}


\section{Changes in Morpho version 0.25 (2013-07-24)}{
  \subsection{R-code}{
    \itemize{
      \item simplified code in 'CVA' and 'CVA.crova'
      \item fixed issue when n-groups > n variables in 'CVA' and 'CVA.crova'
      \item replaced 'nn2' (RANN) with 'ann' (yaImpute) because RANN got (temporarily) banned from CRAN because of violation of policy
      \item added 'readLandmarks.csv' to read landmarks stored in spreadsheet text files (e.g. comma separated)
      \item added check for empty groups in 'typprobClass' and 'covW'
      \item changed cube creation in 'deformGrid3d' (much faster now).
      \item added options weights and centerweight in 'rotonmat'
      \item added confirmation for plotting spheres in 'deformGrid3d' when n > 1000 (can be slow)
      \item 'pcaplot3d' now works if data has only 1 PC
      \item removed useless code remains
      \item added 'bindArr' to concatenate matrices/arrays
      \item changed default core value in 'closemeshKD' from detectCores() to 1.
      \item added option 'keep' in 'rmVertex' 
      \item changed default method in 'meshDist.mesh3d' from vcglib to morpho
      \item renamed 'regdist.raw' to 'regdist' and removed original 'regdist' (too prone to user error)
    }
  }
  \subsection{Package documentation}{
    \itemize{
      \item finally mentioned Marta Rufino for providing all examples in docu for 'CVA' (sorry Marta, I simply forgot)
      \item fixed some docu and added examples in 'pcaplot3d' and
      'rotonmat'
      \item added docu for 'anonymize', 'r2morphoj', 'r2morphologika', 'NNshapeReg', 'kendalldist'
    }
  }
  \subsection{Misc}{
    \itemize{
      \item updated COPYRIGHT file
      \item switched from depends to import for colorRamps, MASS, RANN
    }
  }
}

