%setsize

Setsize1=ones(9,4);
Setsize2=Setsize1+1;
Setsize3=Setsize2+1;
Setsize4=Setsize3+1;

blocks_setsize=[Setsize1;Setsize2;Setsize3;Setsize4];
blocks_difficulty=Shuffle(blocks_setsize)

