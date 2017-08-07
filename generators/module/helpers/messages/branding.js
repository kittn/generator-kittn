const chalk = require('chalk')

const branding = (version, author, website, repoURL) => {
  return chalk`{cyan
                  .c,                                         
                  ;Ol.:,                                      
   :ddo'        ,;,lolc'  ....       ....                     
  .kMMNc         ;kXX0d, ,0XXx.     cKXXo.                    
  .xMMNc         .,,'.   cXMMO'    .oWMMx.                    
  .kMMNc  .cxkkd;.'dkkl,oKWMMN0kkkkkXMMMXOkx,.lkkxccdO0Okl'   
  .kMMNc.:0WMNk;  :XMMk:o0WMMNOxxxxkKWMMXkxd,.kMMMWX0k0NMMXl  
  .xMMW0OWMWO;.   :NMMO. :XMMO'     oWMMx.   .kMMWO,  .cXMMK, 
  .xMMMMMMMX:     :NMMk. :XMMO.     lWMMx.   .kMMNc    .OMMX: 
  .kMMMWNWMMKc    :NMMk. :XMMO.     lWMMx.   .kMMN:    .OMMN: 
  .kMMWk,cKMMNd.  :NMMO. ;XMMK:...'.cNMM0;.'.'kMMN:    .OMMN: 
  .kMMNc  ,OWMWO, :NMMO. .dNMMNKKXXl,kWMWNKNKdOMMN:    .OMMN: 
  .ckkx,   .lkkkl.,dkkl.   ;okOOOko' .:dO0Oxc;lkkx'    .lkkd' 
                              ..         ..                   
  }{hex('#00ffd8').bold
                         FILE GENERATOR}
  `
}

module.exports = branding
