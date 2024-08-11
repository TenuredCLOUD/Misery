/*
Misery Ambient Animals
Drongo Source code edited by TenuredCLOUD (with permission)
Designed specifically for Misery mod
*/

if!(isServer)exitWith{};

_a=[];
{_a pushBack(toUpper _x)}forEach MiseryAnimalTypes;
MiseryAnimalTypes=_a;

_sheepInfo=[["Sheep_random_F"],MiseryAnimalsSheepCount];
_goatInfo=[["Goat_random_F"],MiseryAnimalsGoatCount];
_chookInfo=[["Cock_random_F","Hen_random_F","Hen_random_F","Hen_random_F"],MiseryAnimalsChickenCount];

_animalCountArray=[];
_registeredAnimals=[];
_players=[];
_player=objNull;
_group=grpNull;
_animal=objNull;
_remove=TRUE;
_tries=0;
_clusters=0;
_animalCount=0;
_pos=[];
_spawn=TRUE;
_type="";
_marker="";
_markers=[];
if((count MiseryAnimalTypes)<1)exitWith{systemChat "No ambient animals defined"};

while{TRUE}do{
    _players=call Misery_fnc_ListPlayers;
    _players=_players call BIS_fnc_arrayShuffle;
    {
        _animal=_x;
        _remove=TRUE;
        {if((_x distance2D _animal) < MiseryAnimalDeleteDistance)then{_remove=FALSE}}forEach _players;
        if(_remove)then{_registeredAnimals=_registeredAnimals-[_animal];_x removeAllMPEventHandlers "MPKilled"; deleteVehicle _animal};
    }forEach _registeredAnimals;
    if((count _registeredAnimals) < MiseryMaxAnimalUnits)then{
        if((random 100) > MiseryAnimalSpawnChance)exitWith{};
        {
            _player=_x;
            _clusters=MiseryAnimalClusters call BIS_fnc_RandomInt;
            while{TRUE}do{
                if(_clusters<1)exitWith{};
                _type=selectRandom MiseryAnimalTypes;
                if(_type=="SHEEP")then{_animalCountArray=[]+_sheepInfo select 1};
                if(_type=="GOAT")then{_animalCountArray=[]+_goatInfo select 1};
                if(_type=="CHICKEN")then{_animalCountArray=[]+_chookInfo select 1};
                _animalCount=_animalCountArray call BIS_fnc_RandomInt;
                while{TRUE}do{
                    if(_animalCount<1)exitWith{};
                    _tries=10;
                    while{TRUE}do{
                        if(_tries<1)exitWith{};
                        _spawn=TRUE;
                        _direction = random 360;
                        _pos=(getPos _player)getPos[ MiseryAnimalMinimumDistance,_direction];
                        if!(surfaceIsWater _pos)then{
                            {if((_pos distance2D _x)< MiseryAnimalSafeDistance)exitWith{_spawn=FALSE}}forEach _players;
                            if(_spawn)then{
                                while{TRUE}do{
                                    if(_animalCount<1)exitWith{};
                                    _tries=-1;
                                    if(_type=="SHEEP")then{_type=selectRandom (_sheepInfo select 0)};
                                    if(_type=="GOAT")then{_type=selectRandom (_goatInfo select 0)};
                                    if(_type=="CHICKEN")then{_type=selectRandom (_chookInfo select 0)};
                                    _animal=createAgent[_type,_pos,[],15,"NONE"];
                                    _registeredAnimals pushBack _animal;
                                    if!((count _registeredAnimals)<  MiseryMaxAnimalUnits)exitWith{_clusters=-1;_animalCount=-1;_players=[]};
                                    _animalCount=_animalCount-1;
                                    sleep .2;
                                };
                            };
                        };
                        _tries=_tries-1;
                    };
                };
                _clusters=_clusters-1;
            };
        }forEach _players;
    };
    sleep MiseryAnimalCycleLength;
};
