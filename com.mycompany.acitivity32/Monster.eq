
/*
 * Monster
 * Created by Eqela Studio 2.0b7.4
 */

public class Monster :SEEntity
{
    SESprite monster;
	SESprite text;
    int w;
    int h;
    int mx;
    int my;
    int p_x;
    int p_y;
    
    public void initialize(SEResourceCache rsc)
    {
        base.initialize(rsc);
        w = get_scene_width();
        h = get_scene_height();
        p_x = MainScene.x;
        p_y = MainScene.y;
        
        //add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
        rsc.prepare_image("mymushroom","mushroom", 0.1*w);
        monster = add_sprite_for_image(SEImage.for_resource("mymushroom"));
        //m_x = monster.get_x();
        //m_y = monster.get_y();
        monster.move(Math.random(0,w),Math.random(0,h));
        
    }
    public void tick(TimeVal now, double delta)
    {
        p_x = MainScene.x;
        p_y = MainScene.y;
        mx = monster.get_x();
        my = monster.get_y();
        base.tick(now, delta);
    	monster.move(mx+(p_x-mx)/200,my+(p_y-my)/200);
        if((mx/p_x)==1 && (my/p_y)==1){
            text.set_text("GAME OVER!");
            text.move(0.35*w, 0.45*h);
			}
        
    }
    
    public void cleanup()
    {
        base.cleanup();
        
    }
}
