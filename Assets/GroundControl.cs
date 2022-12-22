using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundControl : MonoBehaviour
{
    public GameObject Ground1;
    public GameObject Ground2;
    public GameObject Door;
    public Material Mat1;
    public Material Mat2;
    public float Distance1;
    public float Distance2;
    public float Speed;
    public float CameraOffset;
    public int GroundSwitch=0;
    // Start is called before the first frame update
    void Start()
    {
        Mat1=Ground1.GetComponent<MeshRenderer>().sharedMaterial;
        Mat2=Ground2.GetComponent<MeshRenderer>().sharedMaterial;
        Door.transform.parent.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        Ground1.transform.parent.position+=new Vector3(0,0,Speed)*Time.deltaTime;
        Ground2.transform.parent.position+=new Vector3(0,0,Speed)*Time.deltaTime;

        Distance1=Ground1.transform.position.z-Camera.main.transform.position.z-CameraOffset;
        Distance1=1-((Distance1+10)/20.0f);
        Distance2=Ground2.transform.position.z-Camera.main.transform.position.z-CameraOffset;
        Distance2=1-((Distance2+10)/20.0f);
        Mat1.SetFloat("_Float0",Distance1);
        Mat2.SetFloat("_Float0",Distance2);
        if(Distance1>1+CameraOffset/20){
            Mat1.SetFloat("_Float0",0);
            GroundSwitch=1;
            Ground1.transform.parent.position=Ground2.transform.parent.position+new Vector3 (0,0,20);
        }
        if(Distance2>1+CameraOffset/20){
            Mat2.SetFloat("_Float0",0);
            GroundSwitch=0;
            Ground2.transform.parent.position=Ground1.transform.parent.position+new Vector3 (0,0,20);
        }
    }
    void OnGUI()
    {
        if(GUI.Button(new Rect(20,20,200,50),"加载完成")){
            if(GroundSwitch==0){
                Door.transform.parent.position=Ground1.transform.position+new Vector3(0,0,10);
            }else{
                Door.transform.parent.position=Ground2.transform.position+new Vector3(0,0,10);
            }
            Door.transform.parent.gameObject.SetActive(true);
        }
    }
}
