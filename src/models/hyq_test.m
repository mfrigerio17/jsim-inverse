addpath('hyq');

% Initialize stuff about the HyQ model

% This is RobCoGen-erated code
hyq.ip  = inertiaProperties();
hyq.xf  = initForceTransforms();
hyq.roy = HyQ();   % the stand-alone robot model in Featherstone's format

% Compute the floating base inertia matrix using RobCoGen code
q = rand(12,1);
hyq.xf = updateForceTransforms(hyq.xf, q);
[H Ic F] = jsim(hyq.ip, hyq.xf);

% Compute the inverse inertia matrix using the new proposed algorithm for the
% floating base case
[Ii Fi Hi] = Hinv_fb( hyq.roy, q);

% Assemble the blocks for easier testing
M = [ Ic F; F' H];
Mi= [ Ii Fi; Fi' Hi];

% M*Mi  should be the identity, so the following should be zero
err = sum(sum(abs(M*Mi))) - 18;
display("If you see a very small number, the test succeded");
display(err);
