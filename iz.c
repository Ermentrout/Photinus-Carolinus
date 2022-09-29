#include <math.h>
#include <stdlib.h>
#define MIN(a,b) ((a)<(b)?(a):(b))
#define real double
#define thr par[5] /* threshold for u */
#define rad par[6] /* radius of interaction */
/* this computes the dynamic interactions */
void IZ(int nn,int ivar,double *par,double *var, double *z[50],double *ydot)
{
  double *u,*x,*y,x0,y0,dx,dy,dx2,dy2;
  double *sss,*xx,*yy;
  int i,j;
  u=var+ivar;
  x=u+3*nn;
  y=x+nn;
  sss=y+8*nn;
  xx=sss+nn;
  yy=xx+nn;


  for(i=0;i<nn;i++){
    sss[i]=0;

    if(u[i]>thr) sss[i]=1.0;
    xx[i]=fmod(x[i],1.0);
    yy[i]=fmod(y[i],1.0);

  }
  for(i=0;i<nn;i++){
    ydot[i]=-sss[i]; /* subtract off self-coupling */
    x0=xx[i];
    y0=yy[i];
    for(j=0;j<nn;j++){
      dx=x0-xx[j];
      dy=y0-yy[j];
      /* fix circular distance */
      dx2=MIN(MIN(fabs(dx),fabs(dx+1)),fabs(dx-1));
      dy2=MIN(MIN(fabs(dy),fabs(dy+1)),fabs(dy-1));
      if((dx2*dx2+dy2*dy2)<rad)ydot[i]=ydot[i]+sss[j];

    }
  }
}
      
    
