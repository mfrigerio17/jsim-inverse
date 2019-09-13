function out = inertiaProperties()

% Inertia parameters as written in the .kindsl model file
out.trunk.mass = 64.862;
out.trunk.tensor = ...
    [[  1.688238,	-(-0.028789),	-(0.277694)];
     [-(-0.028789),	  8.665299 ,	-(0.00382)];
     [-(0.277694),	-(0.00382),	  9.24356]];
out.trunk.com = [0.027222; -2.35E-4; 0.042224];

out.LF_hipassembly.mass = 2.93;
out.LF_hipassembly.tensor = ...
    [[  0.134705,	-(3.6E-5),	-(0.022734)];
     [-(3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(0.022734),	-(5.1E-5),	  0.011033]];
out.LF_hipassembly.com = [0.04263; 0.0; 0.16931];

out.LF_upperleg.mass = 2.638;
out.LF_upperleg.tensor = ...
    [[  0.005495,	-(-0.007418),	-(-1.02E-4)];
     [-(-0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.089871]];
out.LF_upperleg.com = [0.15074; -0.02625; -0.0];

out.LF_lowerleg.mass = 0.881;
out.LF_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.LF_lowerleg.com = [0.1254; 5.0E-4; -1.0E-4];

out.RF_hipassembly.mass = 2.93;
out.RF_hipassembly.tensor = ...
    [[  0.134705,	-(-3.6E-5),	-(-0.022734)];
     [-(-3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(-0.022734),	-(5.1E-5),	  0.011033]];
out.RF_hipassembly.com = [0.04263; -0.0; -0.16931];

out.RF_upperleg.mass = 2.638;
out.RF_upperleg.tensor = ...
    [[  0.005495,	-(-0.007418),	-(-1.02E-4)];
     [-(-0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.089871]];
out.RF_upperleg.com = [0.15074; -0.02625; -0.0];

out.RF_lowerleg.mass = 0.881;
out.RF_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.RF_lowerleg.com = [0.1254; 5.0E-4; -1.0E-4];

out.LH_hipassembly.mass = 2.93;
out.LH_hipassembly.tensor = ...
    [[  0.134705,	-(-3.6E-5),	-(-0.022734)];
     [-(-3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(-0.022734),	-(5.1E-5),	  0.011033]];
out.LH_hipassembly.com = [0.04263; -0.0; -0.16931];

out.LH_upperleg.mass = 2.638;
out.LH_upperleg.tensor = ...
    [[  0.005495,	-(0.007418),	-(1.02E-4)];
     [-(0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.089871]];
out.LH_upperleg.com = [0.15074; 0.02625; 0.0];

out.LH_lowerleg.mass = 0.881;
out.LH_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.LH_lowerleg.com = [0.1254; -5.0E-4; 1.0E-4];

out.RH_hipassembly.mass = 2.93;
out.RH_hipassembly.tensor = ...
    [[  0.134705,	-(3.6E-5),	-(0.022734)];
     [-(3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(0.022734),	-(5.1E-5),	  0.011033]];
out.RH_hipassembly.com = [0.04263; 0.0; 0.16931];

out.RH_upperleg.mass = 2.638;
out.RH_upperleg.tensor = ...
    [[  0.005495,	-(0.007418),	-(1.02E-4)];
     [-(0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.089871]];
out.RH_upperleg.com = [0.15074; 0.02625; 0.0];

out.RH_lowerleg.mass = 0.881;
out.RH_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.RH_lowerleg.com = [0.1254; -5.0E-4; 1.0E-4];


% Now the same inertia parameters expressed in the link frame (may be equal or not to
%  the previous ones, depending on the model file)
out.lf_trunk.mass = 64.862;
out.lf_trunk.tensor = ...
    [[  1.688238,	-(-0.028789),	-(0.277694)];
     [-(-0.028789),	  8.665299 ,	-(0.00382)];
     [-(0.277694),	-(0.00382),	  9.24356]];
out.lf_trunk.com = [0.027222; -2.35E-4; 0.042224];
com = out.lf_trunk.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_trunk.mass;
out.lf_trunk.tensor6D = [out.lf_trunk.tensor, block; block', out.lf_trunk.mass*eye(3)];

out.lf_LF_hipassembly.mass = 2.93;
out.lf_LF_hipassembly.tensor = ...
    [[  0.134705,	-(3.6E-5),	-(0.022734)];
     [-(3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(0.022734),	-(5.1E-5),	  0.011033]];
out.lf_LF_hipassembly.com = [0.04263; 0.0; 0.16931];
com = out.lf_LF_hipassembly.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LF_hipassembly.mass;
out.lf_LF_hipassembly.tensor6D = [out.lf_LF_hipassembly.tensor, block; block', out.lf_LF_hipassembly.mass*eye(3)];

out.lf_LF_upperleg.mass = 2.638;
out.lf_LF_upperleg.tensor = ...
    [[  0.005495,	-(-0.007418),	-(-1.02E-4)];
     [-(-0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.089871]];
out.lf_LF_upperleg.com = [0.15074; -0.02625; -0.0];
com = out.lf_LF_upperleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LF_upperleg.mass;
out.lf_LF_upperleg.tensor6D = [out.lf_LF_upperleg.tensor, block; block', out.lf_LF_upperleg.mass*eye(3)];

out.lf_LF_lowerleg.mass = 0.881;
out.lf_LF_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.lf_LF_lowerleg.com = [0.1254; 5.0E-4; -1.0E-4];
com = out.lf_LF_lowerleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LF_lowerleg.mass;
out.lf_LF_lowerleg.tensor6D = [out.lf_LF_lowerleg.tensor, block; block', out.lf_LF_lowerleg.mass*eye(3)];

out.lf_RF_hipassembly.mass = 2.93;
out.lf_RF_hipassembly.tensor = ...
    [[  0.134705,	-(-3.6E-5),	-(-0.022734)];
     [-(-3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(-0.022734),	-(5.1E-5),	  0.011033]];
out.lf_RF_hipassembly.com = [0.04263; -0.0; -0.16931];
com = out.lf_RF_hipassembly.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RF_hipassembly.mass;
out.lf_RF_hipassembly.tensor6D = [out.lf_RF_hipassembly.tensor, block; block', out.lf_RF_hipassembly.mass*eye(3)];

out.lf_RF_upperleg.mass = 2.638;
out.lf_RF_upperleg.tensor = ...
    [[  0.005495,	-(-0.007418),	-(-1.02E-4)];
     [-(-0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.089871]];
out.lf_RF_upperleg.com = [0.15074; -0.02625; -0.0];
com = out.lf_RF_upperleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RF_upperleg.mass;
out.lf_RF_upperleg.tensor6D = [out.lf_RF_upperleg.tensor, block; block', out.lf_RF_upperleg.mass*eye(3)];

out.lf_RF_lowerleg.mass = 0.881;
out.lf_RF_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.lf_RF_lowerleg.com = [0.1254; 5.0E-4; -1.0E-4];
com = out.lf_RF_lowerleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RF_lowerleg.mass;
out.lf_RF_lowerleg.tensor6D = [out.lf_RF_lowerleg.tensor, block; block', out.lf_RF_lowerleg.mass*eye(3)];

out.lf_LH_hipassembly.mass = 2.93;
out.lf_LH_hipassembly.tensor = ...
    [[  0.134705,	-(-3.6E-5),	-(-0.022734)];
     [-(-3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(-0.022734),	-(5.1E-5),	  0.011033]];
out.lf_LH_hipassembly.com = [0.04263; -0.0; -0.16931];
com = out.lf_LH_hipassembly.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LH_hipassembly.mass;
out.lf_LH_hipassembly.tensor6D = [out.lf_LH_hipassembly.tensor, block; block', out.lf_LH_hipassembly.mass*eye(3)];

out.lf_LH_upperleg.mass = 2.638;
out.lf_LH_upperleg.tensor = ...
    [[  0.005495,	-(0.007418),	-(1.02E-4)];
     [-(0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.089871]];
out.lf_LH_upperleg.com = [0.15074; 0.02625; 0.0];
com = out.lf_LH_upperleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LH_upperleg.mass;
out.lf_LH_upperleg.tensor6D = [out.lf_LH_upperleg.tensor, block; block', out.lf_LH_upperleg.mass*eye(3)];

out.lf_LH_lowerleg.mass = 0.881;
out.lf_LH_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.lf_LH_lowerleg.com = [0.1254; -5.0E-4; 1.0E-4];
com = out.lf_LH_lowerleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_LH_lowerleg.mass;
out.lf_LH_lowerleg.tensor6D = [out.lf_LH_lowerleg.tensor, block; block', out.lf_LH_lowerleg.mass*eye(3)];

out.lf_RH_hipassembly.mass = 2.93;
out.lf_RH_hipassembly.tensor = ...
    [[  0.134705,	-(3.6E-5),	-(0.022734)];
     [-(3.6E-5),	  0.144171 ,	-(5.1E-5)];
     [-(0.022734),	-(5.1E-5),	  0.011033]];
out.lf_RH_hipassembly.com = [0.04263; 0.0; 0.16931];
com = out.lf_RH_hipassembly.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RH_hipassembly.mass;
out.lf_RH_hipassembly.tensor6D = [out.lf_RH_hipassembly.tensor, block; block', out.lf_RH_hipassembly.mass*eye(3)];

out.lf_RH_upperleg.mass = 2.638;
out.lf_RH_upperleg.tensor = ...
    [[  0.005495,	-(0.007418),	-(1.02E-4)];
     [-(0.007418),	  0.087136 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.089871]];
out.lf_RH_upperleg.com = [0.15074; 0.02625; 0.0];
com = out.lf_RH_upperleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RH_upperleg.mass;
out.lf_RH_upperleg.tensor6D = [out.lf_RH_upperleg.tensor, block; block', out.lf_RH_upperleg.mass*eye(3)];

out.lf_RH_lowerleg.mass = 0.881;
out.lf_RH_lowerleg.tensor = ...
    [[  4.68E-4,	-(0.0),	-(0.0)];
     [-(0.0),	  0.026409 ,	-(0.0)];
     [-(0.0),	-(0.0),	  0.026181]];
out.lf_RH_lowerleg.com = [0.1254; -5.0E-4; 1.0E-4];
com = out.lf_RH_lowerleg.com;
block = [  0,    -com(3),  com(2);
         com(3),  0,      -com(1);
        -com(2),  com(1),  0 ] * out.lf_RH_lowerleg.mass;
out.lf_RH_lowerleg.tensor6D = [out.lf_RH_lowerleg.tensor, block; block', out.lf_RH_lowerleg.mass*eye(3)];


% Same inertial properties expressed in a frame with origin in the COM of the link
%  oriented as the default link-frame (the COM coordinates in such a frame should
%  always be [0,0,0] ).
out.com_trunk.mass = 64.862;
out.com_trunk.tensor = ...
    [[  1.5725942,	-(-0.028374067),	-(0.2031402)];
     [-(-0.028374067),	  8.501594 ,	-(0.0044636023)];
     [-(0.2031402),	-(0.0044636023),	  9.195491]];
out.com_trunk.com = [0.0; 0.0; 0.0];

out.com_LF_hipassembly.mass = 2.93;
out.com_LF_hipassembly.tensor = ...
    [[  0.050713986,	-(3.6E-5),	-(0.001586182)];
     [-(3.6E-5),	  0.054855242 ,	-(5.1E-5)];
     [-(0.001586182),	-(5.1E-5),	  0.0057082623]];
out.com_LF_hipassembly.com = [0.0; 0.0; 0.0];

out.com_LF_upperleg.mass = 2.638;
out.com_LF_upperleg.tensor = ...
    [[  0.0036772534,	-(0.0030203676),	-(-1.02E-4)];
     [-(0.0030203676),	  0.027193923 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.028111171]];
out.com_LF_upperleg.com = [0.0; 0.0; 0.0];

out.com_LF_lowerleg.mass = 0.881;
out.com_LF_lowerleg.tensor = ...
    [[  4.6777097E-4,	-(-5.5238703E-5),	-(1.104774E-5)];
     [-(-5.5238703E-5),	  0.012555124 ,	-(4.405E-8)];
     [-(1.104774E-5),	-(4.405E-8),	  0.012326912]];
out.com_LF_lowerleg.com = [0.0; 0.0; 0.0];

out.com_RF_hipassembly.mass = 2.93;
out.com_RF_hipassembly.tensor = ...
    [[  0.050713986,	-(-3.6E-5),	-(-0.001586182)];
     [-(-3.6E-5),	  0.054855242 ,	-(5.1E-5)];
     [-(-0.001586182),	-(5.1E-5),	  0.0057082623]];
out.com_RF_hipassembly.com = [0.0; 0.0; 0.0];

out.com_RF_upperleg.mass = 2.638;
out.com_RF_upperleg.tensor = ...
    [[  0.0036772534,	-(0.0030203676),	-(-1.02E-4)];
     [-(0.0030203676),	  0.027193923 ,	-(-2.1E-5)];
     [-(-1.02E-4),	-(-2.1E-5),	  0.028111171]];
out.com_RF_upperleg.com = [0.0; 0.0; 0.0];

out.com_RF_lowerleg.mass = 0.881;
out.com_RF_lowerleg.tensor = ...
    [[  4.6777097E-4,	-(-5.5238703E-5),	-(1.104774E-5)];
     [-(-5.5238703E-5),	  0.012555124 ,	-(4.405E-8)];
     [-(1.104774E-5),	-(4.405E-8),	  0.012326912]];
out.com_RF_lowerleg.com = [0.0; 0.0; 0.0];

out.com_LH_hipassembly.mass = 2.93;
out.com_LH_hipassembly.tensor = ...
    [[  0.050713986,	-(-3.6E-5),	-(-0.001586182)];
     [-(-3.6E-5),	  0.054855242 ,	-(5.1E-5)];
     [-(-0.001586182),	-(5.1E-5),	  0.0057082623]];
out.com_LH_hipassembly.com = [0.0; 0.0; 0.0];

out.com_LH_upperleg.mass = 2.638;
out.com_LH_upperleg.tensor = ...
    [[  0.0036772534,	-(-0.0030203676),	-(1.02E-4)];
     [-(-0.0030203676),	  0.027193923 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.028111171]];
out.com_LH_upperleg.com = [0.0; 0.0; 0.0];

out.com_LH_lowerleg.mass = 0.881;
out.com_LH_lowerleg.tensor = ...
    [[  4.6777097E-4,	-(5.5238703E-5),	-(-1.104774E-5)];
     [-(5.5238703E-5),	  0.012555124 ,	-(4.405E-8)];
     [-(-1.104774E-5),	-(4.405E-8),	  0.012326912]];
out.com_LH_lowerleg.com = [0.0; 0.0; 0.0];

out.com_RH_hipassembly.mass = 2.93;
out.com_RH_hipassembly.tensor = ...
    [[  0.050713986,	-(3.6E-5),	-(0.001586182)];
     [-(3.6E-5),	  0.054855242 ,	-(5.1E-5)];
     [-(0.001586182),	-(5.1E-5),	  0.0057082623]];
out.com_RH_hipassembly.com = [0.0; 0.0; 0.0];

out.com_RH_upperleg.mass = 2.638;
out.com_RH_upperleg.tensor = ...
    [[  0.0036772534,	-(-0.0030203676),	-(1.02E-4)];
     [-(-0.0030203676),	  0.027193923 ,	-(-2.1E-5)];
     [-(1.02E-4),	-(-2.1E-5),	  0.028111171]];
out.com_RH_upperleg.com = [0.0; 0.0; 0.0];

out.com_RH_lowerleg.mass = 0.881;
out.com_RH_lowerleg.tensor = ...
    [[  4.6777097E-4,	-(5.5238703E-5),	-(-1.104774E-5)];
     [-(5.5238703E-5),	  0.012555124 ,	-(4.405E-8)];
     [-(-1.104774E-5),	-(4.405E-8),	  0.012326912]];
out.com_RH_lowerleg.com = [0.0; 0.0; 0.0];

