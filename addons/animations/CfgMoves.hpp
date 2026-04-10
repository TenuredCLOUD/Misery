class CfgMovesBasic {
    class Default;
    class HealBase: Default {
		disableWeapons = 1;
		disableWeaponsLong = 1;
		showWeaponAim = 0;
		canPullTrigger = 0;
		duty = 0.2;
		limitGunMovement = 0;
		aiming = QUOTE(empty);
		aimingBody = QUOTE(empty);
		actions = QUOTE(HealActionBase);
		looped = 0;
	};
    class ManActions {
        GVAR(disableGesture)[]= {QGVAR(disableGesture), QUOTE(Gesture)};
        GVAR(drinkBottle)[] = {QGVAR(drinkBottle), QUOTE(Gesture)};
        GVAR(drinkFlask)[] = {QGVAR(drinkFlask), QUOTE(Gesture)};
        GVAR(drinkSoda)[] = {QGVAR(drinkSoda), QUOTE(Gesture)};
        GVAR(eatCanned)[] = {QGVAR(eatCanned), QUOTE(Gesture)};
        GVAR(eatPackaged)[] = {QGVAR(eatPackaged), QUOTE(Gesture)};
        GVAR(cigarreteIn)[] = {QGVAR(cigarreteIn), QUOTE(Gesture)};
        GVAR(cigarreteLoop)[] = {QGVAR(cigarreteLoop), QUOTE(Gesture)};
        GVAR(cigarreteOut)[] = {QGVAR(cigarreteOut), QUOTE(Gesture)};
        GVAR(cigarreteIn_mainWeap)[] = {QGVAR(cigarreteIn_mainWeap), QUOTE(Gesture)};
        GVAR(cigarreteLoop_mainWeap)[] = {QGVAR(cigarreteLoop_mainWeap), QUOTE(Gesture)};
        GVAR(cigarreteOut_mainWeap)[] = {QGVAR(cigarreteOut_mainWeap), QUOTE(Gesture)};
        GVAR(thermalPack)[] = {QGVAR(thermalPack), QUOTE(Gesture)};
        GVAR(pillBottle)[] = {QGVAR(pillBottle), QUOTE(Gesture)};
        GVAR(gasMask)[] = {QGVAR(gasMask), QUOTE(Gesture)};
        GVAR(candyBar)[] = {QGVAR(candyBar), QUOTE(Gesture)};
        GVAR(thirsty)[] = {QGVAR(thirsty), QUOTE(Gesture)};
        GVAR(hungry)[] = {QGVAR(hungry), QUOTE(Gesture)};
    };
};

class CfgGesturesMale {
    class ManActions {};
	class Default;
    class BlendAnims {
        GVAR(leftHalfBod)[] = {"RightShoulder",1,"head",1,"neck1",1,"neck",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"Spine",1,"Spine1",1,"Spine2",1,"Spine3",1,"pelvis","MaskStart"};
		GVAR(leftHalfBody_noPelvis)[] = {"head",1,"neck1",1,"neck",1,"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"Spine","MaskStart","Spine1",1,"Spine2",1,"Spine3",};
        GVAR(rightHalfBody)[] = {"LeftShoulder",1,"head",1,"neck1",1,"neck",1,"RightShoulder",1,"RightArm",1,"RightArmRoll",1,"RightForeArm",1,"RightForeArmRoll",1,"RightHand",1,"RightHandRing",1,"RightHandPinky1",1,"RightHandPinky2",1,"RightHandPinky3",1,"RightHandRing1",1,"RightHandRing2",1,"RightHandRing3",1,"RightHandMiddle1",1,"RightHandMiddle2",1,"RightHandMiddle3",1,"RightHandIndex1",1,"RightHandIndex2",1,"RightHandIndex3",1,"RightHandThumb1",1,"RightHandThumb2",1,"RightHandThumb3",1,"Spine","MaskStart","Spine1",1,"Spine2",1,"Spine3",1};
        GVAR(leftHandActual)[] = {"LeftShoulder",1,"LeftArm",1,"LeftArmRoll",1,"LeftForeArm",1,"LeftForeArmRoll",1,"LeftHand",1,"LeftHandRing",1,"LeftHandPinky1",1,"LeftHandPinky2",1,"LeftHandPinky3",1,"LeftHandRing1",1,"LeftHandRing2",1,"LeftHandRing3",1,"LeftHandMiddle1",1,"LeftHandMiddle2",1,"LeftHandMiddle3",1,"LeftHandIndex1",1,"LeftHandIndex2",1,"LeftHandIndex3",1,"LeftHandThumb1",1,"LeftHandThumb2",1,"LeftHandThumb3",1,"pelvis","MaskStart"};
    };

    class States {
        class GVAR(disableGesture): Default {
			speed = 1;
			file = QUOTE(\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon.rtm);
			disableWeapons = 0;
			interpolationRestart = 2;
			weaponIK = 1;
			looped = 0;
			leftHandIKBeg = 1;
			leftHandIKCurve[] = {1};
			leftHandIKEnd = 1;
			rightHandIKBeg = 1;
			rightHandIKCurve[] = {1};
			rightHandIKEnd = 1;
		};
		class GVAR(drinkBottle): Default {
	        speed = 0.17;
			looped = 0;
			file = QPATHTOF(anims\drink.rtm);
			mask = QUOTE(handsWeapon_context);
			disableWeapons = 1;
			interpolationRestart = 2;
			canReload = 0;
			disableWeaponsLong = 0;
			canPullTrigger = 1;
            enableDirectControl = 1;
			leftHandIKBeg = 0;
			leftHandIKCurve[] = {0};
			leftHandIKEnd = 0;
			rightHandIKBeg = 0;
			rightHandIKCurve[] = {0};
			rightHandIKEnd = 0;
		};

        class GVAR(drinkFlask): GVAR(drinkBottle) { speed = 0.14; file = QPATHTOF(anims\flask.rtm); };
        class GVAR(drinkSoda): GVAR(drinkBottle) { speed = 0.19; file = QPATHTOF(anims\energy.rtm); };
        class GVAR(eatCanned): GVAR(drinkBottle) { speed = 0.102; file = QPATHTOF(anims\cannedfood.rtm); };
        class GVAR(eatPackaged): GVAR(drinkBottle) { speed = 0.12; file = QPATHTOF(anims\eat.rtm); };
        class GVAR(thermalPack): GVAR(drinkBottle) { speed = -2.92; file = QPATHTOF(anims\heatpack.rtm); };
        class GVAR(pillBottle): GVAR(drinkBottle) { speed = 0.19; file = QPATHTOF(anims\pills.rtm); };
        class GVAR(candyBar): GVAR(drinkBottle) { speed = -3; file = QPATHTOF(anims\chockalatebar.rtm); };
        class GVAR(gasMask): GVAR(drinkBottle) { speed = 0.65; file = QPATHTOF(anims\gasmask.rtm); };

        class GVAR(cigarreteIn): GVAR(drinkBottle) { speed = 0.2; file = QPATHTOF(anims\cig_in.rtm); };
        class GVAR(cigarreteIn_mainWeap): GVAR(cigarreteIn) {
            file = QPATHTOF(anims\cig_in_weap.rtm);
            leftHandIKCurve[] = {0,1,0.1,0,0.926,0,0.951,1};
            rightHandIKCurve[] = {0,1,0.1,0};
        };

        class GVAR(cigarreteLoop): GVAR(drinkBottle) {
            speed = 0.2;
            looped = 1;
            mask = QGVAR(rightHalfBody);
            file = QPATHTOF(anims\cig_loop.rtm);
        };
        class GVAR(cigarreteLoop_mainWeap): GVAR(cigarreteLoop) {
            file = QPATHTOF(anims\cig_loop.rtm);
            leftHandIKCurve[] = {1};
        };

        class GVAR(cigarreteOut): GVAR(drinkBottle) { speed = -0.6; file = QPATHTOF(anims\cig_out.rtm); mask = QGVAR(rightHalfBody); };
        class GVAR(cigarreteOut_mainWeap): GVAR(cigarreteOut) {
            speed = -0.5;
            file = QPATHTOF(anims\cig_out_weapon.rtm);
            rightHandIKCurve[] = {0,0,0.1,0,0.906,0,0.931,1};
        };

        class GVAR(thirsty): GVAR(drinkBottle) {
            disableWeapons = 0;
            enableOptics = 1;
            speed = -3;
            file = QPATHTOF(anims\wantsTo_Drink.rtm);
            mask = QGVAR(leftHandActual);
        };
        class GVAR(hungry): GVAR(thirsty) {
            speed = -3.1;
            file = QPATHTOF(anims\wantsTo_Eat.rtm);
        };
    };
};
