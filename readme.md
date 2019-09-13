This repository contains an Octave implementation of the algorithm to compute
the inverse of the joint space inertia matrix, for articulated robots.

This repository is associated with submission 19-1223 to RA-L/ICRA 2020:
Marco Frigerio and Herman Bruyninckx, "On the Algorithm for the Inverse of the
Joint–Space Inertia Matrix"


# Requirements
I wrote the code for [Octave][octave-url].

I tested the code and generated the figures in the paper with Octave 5.1.0,
compiled from sources on Ubuntu Linux 16.04, x86_64.

The code depends on the rigid body dynamics library [`spatial_v2`][spatial_v2-url]
by Roy Featherstone. Download it and add the package into the Octave path.

We also use the same robot-model format as `spatial_v2`.


# Contents and usage
* `src/` contains the main algorithm implementation - `Hinv.m` and
`Hinv_fb.m`, the latter for floating base models - as well as some accessory
functions.

* `src/paper` contains the code required to regenerate the plots
included in the paper. Note of course that the results will not be exactly the
same, because of the different platform and the randomized imputs. Please see
and try the `figures.m` script. Please note that for some older Octave versions,
the `cputime` function that we use for the timing tests might not behave
properly (see [here][cputime-bug-url]).

* `src/models` contains additional source code for the [HyQ][hyq-url]
robot model, mostly code generated with [RobCoGen][rcg-url]. Please have a look
and try the `src/models/hyq_test.m` script for a simple test of the algorithm
for floating base robots.

## Sample bootstrap procedure

```
mkdir -p /tmp/ijsim && cd /tmp/ijsim
git clone https://github.com/mfrigerio17/jsim-inverse.git
wget http://royfeatherstone.org/spatial/v2/spatial_v2.zip
unzip spatial_v2.zip
```

Then start the Octave command line:

`taskset --cpu-list 1 octave --no-gui`

(`tasket` attempts to run Octave on a single cpu, to make the benchmarks more
repeatable). Then, at the Octave prompt:

```Octave

addpath( genpath( "/tmp/ijsim/spatial_v2/" ) );
cd "jsim-inverse/src/paper";
addpath("../");
figures; % run the benchmark and accuracy tests and generate the plots
cd ../models;
hyq_test; % test Hinv_fb on the HyQ model

```


# Licensing
Copyright © 2019, Marco Frigerio
All rights reserved.

The software in this repository is released under the permissive BSD 2-clause
license.

See the LICENSE file for more details.


[octave-url]: https://gnu.org/software/octave/
[spatial_v2-url]: http://royfeatherstone.org/spatial/v2/
[hyq-url]: https://dls.iit.it/robots1/hyq
[rcg-url]: http://robcogenteam.bitbucket.io
[cputime-bug-url]: https://octave.1599824.n4.nabble.com/cputime-returns-incorrect-values-td4689259.html


