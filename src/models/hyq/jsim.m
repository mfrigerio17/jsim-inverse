function [H Ic_trunk F] = jsim(inertia_props, force_transforms)

% Initialization of the composite-inertia matrices
Ic_LF_hipassembly = inertia_props.lf_LF_hipassembly.tensor6D;
Ic_LF_upperleg = inertia_props.lf_LF_upperleg.tensor6D;
Ic_LF_lowerleg = inertia_props.lf_LF_lowerleg.tensor6D;
Ic_RF_hipassembly = inertia_props.lf_RF_hipassembly.tensor6D;
Ic_RF_upperleg = inertia_props.lf_RF_upperleg.tensor6D;
Ic_RF_lowerleg = inertia_props.lf_RF_lowerleg.tensor6D;
Ic_LH_hipassembly = inertia_props.lf_LH_hipassembly.tensor6D;
Ic_LH_upperleg = inertia_props.lf_LH_upperleg.tensor6D;
Ic_LH_lowerleg = inertia_props.lf_LH_lowerleg.tensor6D;
Ic_RH_hipassembly = inertia_props.lf_RH_hipassembly.tensor6D;
Ic_RH_upperleg = inertia_props.lf_RH_upperleg.tensor6D;
Ic_RH_lowerleg = inertia_props.lf_RH_lowerleg.tensor6D;
Ic_trunk = inertia_props.lf_trunk.tensor6D;

% "Bottom-up" loop to update the inertia-composite property of each link,
%  for the current configuration

% Link RH_lowerleg
Ic_RH_upperleg = Ic_RH_upperleg + force_transforms.fr_RH_upperleg_XF_fr_RH_lowerleg * Ic_RH_lowerleg * force_transforms.fr_RH_upperleg_XF_fr_RH_lowerleg';

F(:,12) = Ic_RH_lowerleg(:,3);
H(12, 12) = F(3,12);

F(:,12) = force_transforms.fr_RH_upperleg_XF_fr_RH_lowerleg * F(:,12);
H(11, 12) = H(12, 11) = F(3,12);

F(:,12) = force_transforms.fr_RH_hipassembly_XF_fr_RH_upperleg * F(:,12);
H(10, 12) = H(12, 10) = F(3,12);

F(:,12) = force_transforms.fr_trunk_XF_fr_RH_hipassembly * F(:,12);

% Link RH_upperleg
Ic_RH_hipassembly = Ic_RH_hipassembly + force_transforms.fr_RH_hipassembly_XF_fr_RH_upperleg * Ic_RH_upperleg * force_transforms.fr_RH_hipassembly_XF_fr_RH_upperleg';

F(:,11) = Ic_RH_upperleg(:,3);
H(11, 11) = F(3,11);

F(:,11) = force_transforms.fr_RH_hipassembly_XF_fr_RH_upperleg * F(:,11);
H(10, 11) = H(11, 10) = F(3,11);

F(:,11) = force_transforms.fr_trunk_XF_fr_RH_hipassembly * F(:,11);

% Link RH_hipassembly
Ic_trunk = Ic_trunk + force_transforms.fr_trunk_XF_fr_RH_hipassembly * Ic_RH_hipassembly * force_transforms.fr_trunk_XF_fr_RH_hipassembly';

F(:,10) = Ic_RH_hipassembly(:,3);
H(10, 10) = F(3,10);

F(:,10) = force_transforms.fr_trunk_XF_fr_RH_hipassembly * F(:,10);

% Link LH_lowerleg
Ic_LH_upperleg = Ic_LH_upperleg + force_transforms.fr_LH_upperleg_XF_fr_LH_lowerleg * Ic_LH_lowerleg * force_transforms.fr_LH_upperleg_XF_fr_LH_lowerleg';

F(:,9) = Ic_LH_lowerleg(:,3);
H(9, 9) = F(3,9);

F(:,9) = force_transforms.fr_LH_upperleg_XF_fr_LH_lowerleg * F(:,9);
H(8, 9) = H(9, 8) = F(3,9);

F(:,9) = force_transforms.fr_LH_hipassembly_XF_fr_LH_upperleg * F(:,9);
H(7, 9) = H(9, 7) = F(3,9);

F(:,9) = force_transforms.fr_trunk_XF_fr_LH_hipassembly * F(:,9);

% Link LH_upperleg
Ic_LH_hipassembly = Ic_LH_hipassembly + force_transforms.fr_LH_hipassembly_XF_fr_LH_upperleg * Ic_LH_upperleg * force_transforms.fr_LH_hipassembly_XF_fr_LH_upperleg';

F(:,8) = Ic_LH_upperleg(:,3);
H(8, 8) = F(3,8);

F(:,8) = force_transforms.fr_LH_hipassembly_XF_fr_LH_upperleg * F(:,8);
H(7, 8) = H(8, 7) = F(3,8);

F(:,8) = force_transforms.fr_trunk_XF_fr_LH_hipassembly * F(:,8);

% Link LH_hipassembly
Ic_trunk = Ic_trunk + force_transforms.fr_trunk_XF_fr_LH_hipassembly * Ic_LH_hipassembly * force_transforms.fr_trunk_XF_fr_LH_hipassembly';

F(:,7) = Ic_LH_hipassembly(:,3);
H(7, 7) = F(3,7);

F(:,7) = force_transforms.fr_trunk_XF_fr_LH_hipassembly * F(:,7);

% Link RF_lowerleg
Ic_RF_upperleg = Ic_RF_upperleg + force_transforms.fr_RF_upperleg_XF_fr_RF_lowerleg * Ic_RF_lowerleg * force_transforms.fr_RF_upperleg_XF_fr_RF_lowerleg';

F(:,6) = Ic_RF_lowerleg(:,3);
H(6, 6) = F(3,6);

F(:,6) = force_transforms.fr_RF_upperleg_XF_fr_RF_lowerleg * F(:,6);
H(5, 6) = H(6, 5) = F(3,6);

F(:,6) = force_transforms.fr_RF_hipassembly_XF_fr_RF_upperleg * F(:,6);
H(4, 6) = H(6, 4) = F(3,6);

F(:,6) = force_transforms.fr_trunk_XF_fr_RF_hipassembly * F(:,6);

% Link RF_upperleg
Ic_RF_hipassembly = Ic_RF_hipassembly + force_transforms.fr_RF_hipassembly_XF_fr_RF_upperleg * Ic_RF_upperleg * force_transforms.fr_RF_hipassembly_XF_fr_RF_upperleg';

F(:,5) = Ic_RF_upperleg(:,3);
H(5, 5) = F(3,5);

F(:,5) = force_transforms.fr_RF_hipassembly_XF_fr_RF_upperleg * F(:,5);
H(4, 5) = H(5, 4) = F(3,5);

F(:,5) = force_transforms.fr_trunk_XF_fr_RF_hipassembly * F(:,5);

% Link RF_hipassembly
Ic_trunk = Ic_trunk + force_transforms.fr_trunk_XF_fr_RF_hipassembly * Ic_RF_hipassembly * force_transforms.fr_trunk_XF_fr_RF_hipassembly';

F(:,4) = Ic_RF_hipassembly(:,3);
H(4, 4) = F(3,4);

F(:,4) = force_transforms.fr_trunk_XF_fr_RF_hipassembly * F(:,4);

% Link LF_lowerleg
Ic_LF_upperleg = Ic_LF_upperleg + force_transforms.fr_LF_upperleg_XF_fr_LF_lowerleg * Ic_LF_lowerleg * force_transforms.fr_LF_upperleg_XF_fr_LF_lowerleg';

F(:,3) = Ic_LF_lowerleg(:,3);
H(3, 3) = F(3,3);

F(:,3) = force_transforms.fr_LF_upperleg_XF_fr_LF_lowerleg * F(:,3);
H(2, 3) = H(3, 2) = F(3,3);

F(:,3) = force_transforms.fr_LF_hipassembly_XF_fr_LF_upperleg * F(:,3);
H(1, 3) = H(3, 1) = F(3,3);

F(:,3) = force_transforms.fr_trunk_XF_fr_LF_hipassembly * F(:,3);

% Link LF_upperleg
Ic_LF_hipassembly = Ic_LF_hipassembly + force_transforms.fr_LF_hipassembly_XF_fr_LF_upperleg * Ic_LF_upperleg * force_transforms.fr_LF_hipassembly_XF_fr_LF_upperleg';

F(:,2) = Ic_LF_upperleg(:,3);
H(2, 2) = F(3,2);

F(:,2) = force_transforms.fr_LF_hipassembly_XF_fr_LF_upperleg * F(:,2);
H(1, 2) = H(2, 1) = F(3,2);

F(:,2) = force_transforms.fr_trunk_XF_fr_LF_hipassembly * F(:,2);

% Link LF_hipassembly
Ic_trunk = Ic_trunk + force_transforms.fr_trunk_XF_fr_LF_hipassembly * Ic_LF_hipassembly * force_transforms.fr_trunk_XF_fr_LF_hipassembly';

F(:,1) = Ic_LF_hipassembly(:,3);
H(1, 1) = F(3,1);

F(:,1) = force_transforms.fr_trunk_XF_fr_LF_hipassembly * F(:,1);
